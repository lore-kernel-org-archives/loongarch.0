Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A7110EC
	for <loongarch@lists.linux.dev>; Wed,  1 Mar 2023 08:55:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B58C433EF;
	Wed,  1 Mar 2023 08:55:52 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: linux-efi@vger.kernel.org,
	loongarch@lists.linux.dev,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Xuerui Wang <kernel@xen0n.name>,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH] efi/loongarch: Reintroduce efi_relocate_kernel() to relocate kernel
Date: Wed,  1 Mar 2023 16:55:45 +0800
Message-Id: <20230301085545.2373646-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since Linux-6.3, LoongArch supports PIE kernel now, so let's reintroduce
efi_relocate_kernel() to relocate the core kernel.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/firmware/efi/libstub/loongarch-stub.c | 24 ++++++-------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/firmware/efi/libstub/loongarch-stub.c b/drivers/firmware/efi/libstub/loongarch-stub.c
index eee7ed43cdfb..72c71ae201f0 100644
--- a/drivers/firmware/efi/libstub/loongarch-stub.c
+++ b/drivers/firmware/efi/libstub/loongarch-stub.c
@@ -21,26 +21,16 @@ efi_status_t handle_kernel_image(unsigned long *image_addr,
 				 efi_loaded_image_t *image,
 				 efi_handle_t image_handle)
 {
-	int nr_pages = round_up(kernel_asize, EFI_ALLOC_ALIGN) / EFI_PAGE_SIZE;
-	efi_physical_addr_t kernel_addr = EFI_KIMG_PREFERRED_ADDRESS;
 	efi_status_t status;
+	unsigned long kernel_addr = 0;
 
-	/*
-	 * Allocate space for the kernel image at the preferred offset. This is
-	 * the only location in memory from where we can execute the image, so
-	 * no point in falling back to another allocation.
-	 */
-	status = efi_bs_call(allocate_pages, EFI_ALLOCATE_ADDRESS,
-			     EFI_LOADER_DATA, nr_pages, &kernel_addr);
-	if (status != EFI_SUCCESS)
-		return status;
-
-	*image_addr = EFI_KIMG_PREFERRED_ADDRESS;
-	*image_size = kernel_asize;
+	kernel_addr = (unsigned long)&kernel_offset - kernel_offset;
+
+	status = efi_relocate_kernel(&kernel_addr, kernel_fsize, kernel_asize,
+		     EFI_KIMG_PREFERRED_ADDRESS, efi_get_kimg_min_align(), 0x0);
 
-	memcpy((void *)EFI_KIMG_PREFERRED_ADDRESS,
-	       (void *)&kernel_offset - kernel_offset,
-	       kernel_fsize);
+	*image_addr = kernel_addr;
+	*image_size = kernel_asize;
 
 	return status;
 }
-- 
2.39.1

