Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABFD468F
	for <loongarch@lists.linux.dev>; Sun, 18 Sep 2022 21:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6280C433C1;
	Sun, 18 Sep 2022 21:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663536960;
	bh=TJjBRuCFTW+TJ1tt9NdDPb5mim7RRsT5BJz/uob9soA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ouymYfWFPXrDhSVTKIcxCCgoerFV7LjGU/A48qK0PbAwS2c45hhtnVE8gztZVa+Lh
	 Ib1diYe+z3LF/mLC4nWJ5yFBCaVC7h2dLAoIqHCjzMP9WGdTWTUP1rOGqVAkfJT5IU
	 ZIhj84bitKoPZCyzBwdLNQ3xXOe8K9ZvaZ8ehf6BhCpEU9/jYwl2FLaVAS1xuz90eA
	 RJr31dBkt4joc0N/CK3Y/xEholrB3zz8G3RdlUKhx5Vz0EOu2D1ZITOzDcZm2ljftl
	 +6rltJoWsNl5XsXoMLxLTdRkIBKV1HZecT9cdRlt5Hq2Ih0ZTHC2P3oJsisReGGzhF
	 ricYegAX7N2Bg==
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-efi@vger.kernel.org
Cc: loongarch@lists.linux.dev,
	linux@armlinux.org.uk,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Xi Ruoyao <xry111@xry111.site>,
	stable@vger.kernel.org
Subject: [PATCH 01/12] efi: libstub: drop pointless get_memory_map() call
Date: Sun, 18 Sep 2022 23:35:33 +0200
Message-Id: <20220918213544.2176249-2-ardb@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220918213544.2176249-1-ardb@kernel.org>
References: <20220918213544.2176249-1-ardb@kernel.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124; i=ardb@kernel.org; h=from:subject; bh=TJjBRuCFTW+TJ1tt9NdDPb5mim7RRsT5BJz/uob9soA=; b=owEB7QES/pANAwAKAcNPIjmS2Y8kAcsmYgBjJ48bKlM+G5MYutM2WkSBF4HCuh+vKaoUimCOFi8b OqVzWv6JAbMEAAEKAB0WIQT72WJ8QGnJQhU3VynDTyI5ktmPJAUCYyePGwAKCRDDTyI5ktmPJCdHDA C+XpPZryd6JF0pxHF7VvkMPRMqZ/4CgyBiS4kQhzfaW8Hv9/ZNvJ5wM/dcQ1xPWHi4gSXn47CylTJI gJqPY9FaPFlS9Cy/cOwSEZuDN8JjxXlAzt5tk2VjS9U2iDBJa8Zx5y6hIgjBg1D8v/vfBEFAaBvTg7 EeVwfrO73C9qvZU/e2DsWrkwHQczHxgyqeObDc7khxJdANkdOnQ8cNsUuqsdX3DnKH1NflXFLf+Fw/ 1OekhLc+zJXmBx1nvZkrVuKROIKS+DPKV78CQnUAKOuDIvXKmIcDqXG0F1BNN/hJltJSf02r3ZZ3vc 45I8vQAt23P4Uo88bbNgRlJKlJ1SP9F5zXF2V/UJT9GNKh/jS5BRuW1PB7Rg4rBU31UNJdbT/WaKMj f92bBQ6DXgh0ReqDS9wJ3bkPs2//RNe23rlgVuzaPd4zup0wFov0C7v6rh0EMT9/JqhoCnSTA/KXMi yFZHXBlWQSEK/OMq5sfNAo31Ujf9jrGIMaEXmQWlBLFOM=
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Transfer-Encoding: 8bit

Currently, the non-x86 stub code calls get_memory_map() redundantly,
given that the data it returns is never used anywhere. So drop the call.

Cc: <stable@vger.kernel.org> # v4.14+
Fixes: 24d7c494ce46 ("efi/arm-stub: Round up FDT allocation to mapping size")
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/fdt.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/firmware/efi/libstub/fdt.c b/drivers/firmware/efi/libstub/fdt.c
index fe567be0f118..804f542be3f2 100644
--- a/drivers/firmware/efi/libstub/fdt.c
+++ b/drivers/firmware/efi/libstub/fdt.c
@@ -280,14 +280,6 @@ efi_status_t allocate_new_fdt_and_exit_boot(void *handle,
 		goto fail;
 	}
 
-	/*
-	 * Now that we have done our final memory allocation (and free)
-	 * we can get the memory map key needed for exit_boot_services().
-	 */
-	status = efi_get_memory_map(&map);
-	if (status != EFI_SUCCESS)
-		goto fail_free_new_fdt;
-
 	status = update_fdt((void *)fdt_addr, fdt_size,
 			    (void *)*new_fdt_addr, MAX_FDT_SIZE, cmdline_ptr,
 			    initrd_addr, initrd_size);
-- 
2.35.1

