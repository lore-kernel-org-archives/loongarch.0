Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876E71CC882;
	Wed,  6 Nov 2024 07:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730878061; cv=none; b=Iew3uWS0PqzUW1IQPCWuUApB/Wx8qa/bSe0kP6m0WD711pci30no6c12PDELvn+KKS+Yr5CF/V7W0+RTQmFiSANClVDEdxn2eXnN+yuic4OI/4GYAyLDb9YKcurs9S9U3f+/7tythBgy5mvPQGVswjTwJMAB+/iGJ9lL6+yz/RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730878061; c=relaxed/simple;
	bh=p7mNA6iu8XWF7HYma1orzvs8JPDyaSivdzr1n+3CBN8=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=iUdikKAkucszh0XMqr6JCreAlpVD15PhKqjLGGxtFwF8PNu4NBpgajGlTKyHZQEMKXtAymLud8riXR6uzITnYDE7V9FxjgMONNxwrtls1Krb4h6Sue9GBV5PhZsA0QdFmfEfbZ7r70KaD8Hr0x9wdqwLDHJj/wPihmWVCc+s1t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZiI12kRB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZiI12kRB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 771A1C4CED0;
	Wed,  6 Nov 2024 07:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730878061;
	bh=p7mNA6iu8XWF7HYma1orzvs8JPDyaSivdzr1n+3CBN8=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=ZiI12kRBnB5RqkrKn5fEQeDBp5uleQeDczBR5Oev9muuC+ejQNMGVmCDaTnyumHED
	 rIMT0DhZXh6+eOuUBBSOWoZVI7alkYff3qUxHv5TPajr2r/EfI4IECDo0AFnQrnFEn
	 mxXFEId7LTop5jS3xF3SPLsxUVatqIo1STqE/7mQ=
Subject: Patch "LoongArch: Fix build errors due to backported TIMENS" has been added to the 6.1-stable tree
To: chenhuacai@kernel.org,chenhuacai@loongson.cn,gregkh@linuxfoundation.org,jiaxun.yang@flygoat.com,kernel@xen0n.name,loongarch@lists.linux.dev,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 06 Nov 2024 08:27:22 +0100
In-Reply-To: <20241102033616.3517188-1-chenhuacai@loongson.cn>
Message-ID: <2024110622-stunning-sierra-01fb@gregkh>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore


This is a note to let you know that I've just added the patch titled

    LoongArch: Fix build errors due to backported TIMENS

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     loongarch-fix-build-errors-due-to-backported-timens.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From chenhuacai@loongson.cn  Wed Nov  6 08:26:52 2024
From: Huacai Chen <chenhuacai@loongson.cn>
Date: Sat,  2 Nov 2024 11:36:16 +0800
Subject: LoongArch: Fix build errors due to backported TIMENS
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>
Message-ID: <20241102033616.3517188-1-chenhuacai@loongson.cn>

From: Huacai Chen <chenhuacai@loongson.cn>

Commit eb3710efffce1dcff83761db4615f91d93aabfcb ("LoongArch: Add support
to clone a time namespace") backports the TIMENS support for LoongArch
(corresponding upstream commit aa5e65dc0818bbf676bf06927368ec46867778fd)
but causes build errors:

  CC      arch/loongarch/kernel/vdso.o
arch/loongarch/kernel/vdso.c: In function ‘vvar_fault’:
arch/loongarch/kernel/vdso.c:54:36: error: implicit declaration of
function ‘find_timens_vvar_page’ [-Werror=implicit-function-declaration]
   54 |         struct page *timens_page = find_timens_vvar_page(vma);
      |                                    ^~~~~~~~~~~~~~~~~~~~~
arch/loongarch/kernel/vdso.c:54:36: warning: initialization of ‘struct
page *’ from ‘int’ makes pointer from integer without a cast
[-Wint-conversion]
arch/loongarch/kernel/vdso.c: In function ‘vdso_join_timens’:
arch/loongarch/kernel/vdso.c:143:25: error: implicit declaration of
function ‘zap_vma_pages’; did you mean ‘zap_vma_ptes’?
[-Werror=implicit-function-declaration]
  143 |                         zap_vma_pages(vma);
      |                         ^~~~~~~~~~~~~
      |                         zap_vma_ptes
cc1: some warnings being treated as errors

Because in 6.1.y we should define find_timens_vvar_page() by ourselves
and use zap_page_range() instead of zap_vma_pages(), so fix it.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/kernel/vdso.c |   28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

--- a/arch/loongarch/kernel/vdso.c
+++ b/arch/loongarch/kernel/vdso.c
@@ -40,6 +40,8 @@ static struct page *vdso_pages[] = { NUL
 struct vdso_data *vdso_data = generic_vdso_data.data;
 struct vdso_pcpu_data *vdso_pdata = loongarch_vdso_data.vdata.pdata;
 
+static struct page *find_timens_vvar_page(struct vm_area_struct *vma);
+
 static int vdso_mremap(const struct vm_special_mapping *sm, struct vm_area_struct *new_vma)
 {
 	current->mm->context.vdso = (void *)(new_vma->vm_start);
@@ -139,13 +141,37 @@ int vdso_join_timens(struct task_struct
 
 	mmap_read_lock(mm);
 	for_each_vma(vmi, vma) {
+		unsigned long size = vma->vm_end - vma->vm_start;
+
 		if (vma_is_special_mapping(vma, &vdso_info.data_mapping))
-			zap_vma_pages(vma);
+			zap_page_range(vma, vma->vm_start, size);
 	}
 	mmap_read_unlock(mm);
 
 	return 0;
 }
+
+static struct page *find_timens_vvar_page(struct vm_area_struct *vma)
+{
+	if (likely(vma->vm_mm == current->mm))
+		return current->nsproxy->time_ns->vvar_page;
+
+	/*
+	 * VM_PFNMAP | VM_IO protect .fault() handler from being called
+	 * through interfaces like /proc/$pid/mem or
+	 * process_vm_{readv,writev}() as long as there's no .access()
+	 * in special_mapping_vmops.
+	 * For more details check_vma_flags() and __access_remote_vm()
+	 */
+	WARN(1, "vvar_page accessed remotely");
+
+	return NULL;
+}
+#else
+static struct page *find_timens_vvar_page(struct vm_area_struct *vma)
+{
+	return NULL;
+}
 #endif
 
 static unsigned long vdso_base(void)


Patches currently in stable-queue which might be from chenhuacai@loongson.cn are

queue-6.1/loongarch-fix-build-errors-due-to-backported-timens.patch
