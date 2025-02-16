<template>
    <div class="app-container">
        <div class="blog-container">
            <!-- 左侧博客列表 -->
            <div class="blog-list">
                <div class="list-header">
                    <span>博客列表</span>
                    <el-button type="primary" size="small" icon="el-icon-plus" @click="handleCreate">
                        写博客
                    </el-button>
                </div>
                <el-tree :data="TreeData" :props="defaultProps" @node-click="handleNodeClick"
                    :highlight-current="true">
                    <span class="custom-tree-node" slot-scope="{ node, data }">
                        <span>{{ node.label }}</span>
                        <span class="blog-meta" v-if="!data.children">
                            {{ data.createTime }}
                        </span>
                    </span>
                </el-tree>
            </div>

            <!-- 右侧博客内容 -->
            <div class="blog-content" v-if="currentBlog">
                <div class="content-header">
                    <div class="title-wrapper">
                        <h2>{{ currentBlog.title }}</h2>
                        <div class="operation-buttons">
                            <el-button type="primary" size="mini" icon="el-icon-edit" @click="handleEdit">修改</el-button>
                            <el-button type="danger" size="mini" icon="el-icon-delete"
                                @click="handleDelete">删除</el-button>
                        </div>
                    </div>
                    <div class="blog-info">
                        <span>作者：{{ currentBlog.author }}</span>
                        <span>{{ currentBlog.updateTime ? ('更新时间：' + currentBlog.updateTime) : ('发布时间：' +
                            currentBlog.createTime) }}</span>
                        <span>分类：{{ currentBlog.categoryName }}</span>
                    </div>
                </div>
                <div class="action-buttons">
                    <el-button type="success" icon="el-icon-thumb" @click="handleLike">点赞</el-button>
                    <el-button type="info" icon="el-icon-chat-line-square" @click="handleComment">评论</el-button>
                </div>
                <div class="markdown-body" v-html="compiledMarkdown"></div>

            </div>
            <div class="blog-content empty" v-else>
                <el-empty description="请选择要查看的博客"></el-empty>
            </div>

            <!-- Markdown 编辑器弹窗 -->
            <el-dialog :title="dialogTitle" :visible.sync="dialogVisible" width="90%" :before-close="handleClose"
                :close-on-click-modal="false" fullscreen>
                <el-form :model="blogForm" ref="blogForm" :rules="rules" label-width="80px">
                    <el-form-item label="标题" prop="title">
                        <el-input v-model="blogForm.title" placeholder="请输入博客标题"></el-input>
                    </el-form-item>
                    <el-form-item label="分类" prop="categoryName">
                        <el-select v-model="blogForm.categoryName" placeholder="请选择或输入新分类" filterable allow-create
                            default-first-option @change="handleCategoryChange">
                            <el-option v-for="category in existingCategories" :key="category.id" :label="category.name"
                                :value="category.name">
                            </el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="内容" prop="content">
                        <mavon-editor v-model="blogForm.content" :toolbars="markdownOption" @save="handleSave" style="height: 500px;" />
                    </el-form-item>
                </el-form>
                <div slot="footer" class="dialog-footer">
                    <el-button @click="handleClose">取 消</el-button>
                    <el-button type="primary" @click="handleSave">保 存</el-button>
                </div>
            </el-dialog>
        </div>
    </div>
</template>

<script>
import { listBlog, addBlog, updateBlog, delBlog, getOne } from '@/api/wanfeng/learn/blog'
import { mavonEditor } from 'mavon-editor'
import MarkdownIt from 'markdown-it/dist/markdown-it.js'
import 'mavon-editor/dist/css/index.css'
import 'github-markdown-css'

export default {
    name: 'BlogIndex',
    components: {
        mavonEditor
    },
    data() {
        return {
            originData:null,
            dialogTitle: "",
            dialogVisible:false,
            isEditing:false,
            TreeData: [],
            defaultProps: {
                children: 'children',
                label: 'label'
            },
            currentBlog: null,
            blogForm: {
                blogId: undefined,
                title: '',
                categoryName: '',
                content: '',
                categoryId: undefined
            },
            rules: {
                title: [
                    { required: true, message: '请输入博客标题', trigger: 'blur' }
                ],
                categoryName: [
                    { required: true, message: '请选择博客分类', trigger: 'change' }
                ]
            },
            markdownOption: {
                bold: true,
                italic: true,
                header: true,
                underline: true,
                strikethrough: true,
                mark: true,
                superscript: true,
                subscript: true,
                quote: true,
                ol: true,
                ul: true,
                link: true,
                imagelink: true,
                code: true,
                table: true,
                fullscreen: true,
                readmodel: true,
                htmlcode: true,
                help: true,
                undo: true,
                redo: true,
                trash: true,
                save: true,
                navigation: true
            },
            md: new MarkdownIt(),
            existingCategories: [], // 存储现有分类详细信息
        }
    },
    computed: {
        compiledMarkdown() {
            return this.currentBlog ? this.md.render(this.currentBlog.content) : ''
        }
    },
    created() {
        this.getList()
    },
    methods: {
        /** 查询博客列表 */
        getList() {
            return listBlog().then(response => {
                if (response.code === 200) {
                    this.originData= response.data
                    this.TreeData = this.handleTreeData(response.data)
                    this.getCategories()
                    return response.data
                } else {
                    this.$message.error('获取博客列表失败')
                }
            }).catch(error => {
                this.$message.error('获取博客列表出错：' + error.message)
            })
        },

        /** 将扁平数据转换为树形结构 */
        handleTreeData(data) {
            const categories = [...new Set(data.map(item => item.categoryName))];

            return categories.map(category => {
                return {
                    id: category.toLowerCase(),
                    label: category,
                    children: data.filter(item => item.categoryName === category && item.blogId).map(blog => ({
                        blogId: blog.blogId,
                        label: blog.title,
                        categoryName: blog.categoryName,
                        categoryId: blog.categoryId,
                        author: blog.author,
                        createTime: blog.createTime,
                        updateTime: blog.updateTime,
                        content: blog.content,
                        title: blog.title
                    }))
                };
            });
        },

        // 处理点击博客列表项
        handleNodeClick(data) {
            if (!data.children) {
                getOne(data.blogId).then(response=>{
                    data.userId=response.data.userId
                    data.content = response.data.content
                    this.currentBlog = data
                })
            }
        },
        // 处理新建博客
        handleCreate() {
            this.dialogTitle = "写博客"
            this.dialogVisible = true
            this.getCategories()
            this.resetForm()
        },


        handleSave() {
            this.$refs.blogForm.validate(valid => {
                if (valid) {
                    const blogData = {
                        title: this.blogForm.title,
                        content: this.blogForm.content,
                        categoryId: this.blogForm.categoryId, // 传递分类ID
                        categoryName:this.blogForm.categoryName,
                        userId:this.blogForm.userId
                    };

                    if (this.isEditing) {
                        blogData.blogId = this.blogForm.blogId; // 传递博客ID
                    }

                    const savePromise = this.isEditing ? updateBlog(blogData) : addBlog(blogData);
                    savePromise.then(response => {
                        this.$message.success('保存成功');
                        // 刷新页面并获取最新的文章列表
                        this.getList().then(() => {
                            // 查找对应的文章
                            const updatedBlog = this.findBlogInList(blogData.title, blogData.categoryName);
                            console.log(updateBlog)
                            if (updatedBlog) {
                                getOne(updatedBlog.blogId).then(response=>{
                                    updatedBlog.content = response.data.content
                                    updatedBlog.userId = response.data.userId
                                    this.currentBlog = updatedBlog
                                })
                            }
                        });
                        this.dialogVisible = false; // 关闭弹出框
                        this.isEditing = false;
                    });
                } else {
                    this.$message.error('请确保所有必填字段都已填写');
                }
            });
        },

        findBlogInList(title, categoryName) {
            return this.TreeData.flatMap(category => category.children || []).find(blog =>
                blog.title === title && blog.categoryName === categoryName
            );
        },

        handleClose() {
            this.dialogVisible = false
        },

        // 处理修改按钮点击
        handleEdit() {
            this.isEditing = true;
            this.dialogTitle = "编辑博客";
            this.blogForm.blogId = this.currentBlog.blogId;
            this.blogForm.title = this.currentBlog.title;
            this.blogForm.categoryName = this.currentBlog.categoryName;
            this.blogForm.content = this.currentBlog.content;
            this.blogForm.categoryId = this.currentBlog.categoryId;
            this.blogForm.userId=this.currentBlog.userId;
            this.dialogVisible = true;
        },

        // 处理删除按钮点击
        handleDelete() {
            this.$confirm('确认删除该博客吗？', '警告', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning'
            }).then(() => {
                delBlog(this.currentBlog.blogId).then(response => {
                    this.$message.success('删除成功')
                    this.getList()
                    this.currentBlog = null
                })
            }).catch(() => { })
        },

        // 重置表单
        resetForm() {
            this.blogForm = {
                blogId: null,
                title: '',
                categoryName: '',
                content: '',
                categoryId: null
            };
        },

        // 获取所有现有分类,用于在表单中选择不同的分类
        getCategories() {
            const categories = [];
            this.TreeData.forEach(data => {
                data.children.forEach(blog => {
                    if (!categories.some(c => c.id === blog.categoryId)) {
                        categories.push({
                            id: blog.categoryId,
                            name: blog.categoryName
                        });
                    }
                });
            });

            // 从 originData 中获取分类名称和分类ID
            const additionalCategories = [...new Set(this.originData.map(item => ({
                id: item.categoryId,
                name: item.categoryName
            })))];

            // 合并两个分类数组
            additionalCategories.forEach(category => {
                if (!categories.some(c => c.id === category.id)) {
                    categories.push(category);
                }
            });

            this.existingCategories = categories;
        },

        // 处理分类选择框变化事件
        handleCategoryChange(newCategoryName) {
            const selectedCategory = this.existingCategories.find(category => category.name === newCategoryName)
            if (selectedCategory) {
                this.blogForm.categoryId = selectedCategory.id
            } else {
                this.blogForm.categoryId = null
            }
        },

        handleLike() {
            console.log(this.currentBlog)
        },

        handleComment() {
            console.log(this.currentBlog)
        },
    }
}
</script>

<style scoped>
.blog-container {
    display: flex;
    height: calc(100vh - 120px);
    background: #fff;
    border-radius: 4px;
}

.blog-list {
    width: 300px;
    border-right: 1px solid #e6e6e6;
    padding: 20px;
}

.list-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 1px solid #e6e6e6;
}

.blog-content {
    flex: 1;
    padding: 20px;
    overflow-y: auto;
}

.content-header {
    margin-bottom: 20px;
    padding-bottom: 10px;
    border-bottom: 1px solid #e6e6e6;
}

.title-wrapper {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.operation-buttons {
    margin-left: 20px;
}

.blog-info {
    margin-top: 10px;
    color: #666;
    font-size: 14px;
}

.blog-info span {
    margin-right: 20px;
}

.custom-tree-node {
    flex: 1;
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: 14px;
    padding-right: 8px;
}

.blog-meta {
    color: #999;
    font-size: 12px;
}

.empty {
    display: flex;
    justify-content: center;
    align-items: center;
}

.markdown-body {
    box-sizing: border-box;
    min-width: 200px;
    max-width: 980px;
    margin: 0 auto;
    padding: 45px;
}

@media (max-width: 767px) {
    .markdown-body {
        padding: 15px;
    }
}

/* 分类节点样式 */
.el-tree-node__content {
    height: 32px;
}

.el-tree-node.is-current>.el-tree-node__content {
    background-color: #f5f7fa;
}

.el-dialog__body {
    padding: 10px 20px;
}

.mavon-editor {
    height: 600px;
}

.action-buttons {
    margin-top: 20px;
    display: flex;
    justify-content: flex-end;
}
</style>