Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FC03F8EDE
	for <loongarch@lists.linux.dev>; Wed, 10 Jun 2026 10:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781088139; cv=none; b=ekSH3OsgOkf1n62CgUJ+F2dStl3ubV1vS/1eSq6WHW+WaUpZs6ojVcUNRUc5eFKu5NU3o9p+1NgYqHWa0Mi8FQSy2VdUhUSf3jNEj1uGiEJrTJQ+lTIVkEr3dFAVFVo4jqB5n1XBHRyRpkb1YrHagzoUpvJcUOwLLD2IWOxCSdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781088139; c=relaxed/simple;
	bh=AejRrTd544s9CWfnJYqu9mq0HIlqyHu4CWGR7qz/D24=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version:Content-Type; b=DrORn7h+7enJIuhSz8by/ufZb0OhORg96r0XTed3TGu4WH4NdX0afG/EsSewzpsjyLPGd/pNHpuGG3hx2yfJJM2QobwE54pAja2qTe0CAxjUik1f6t0POOxThcuVdVjIYoo0c9yxcQA1KC9ZkQg+k3asFRG67ItzyuQLjyk4wPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com; spf=pass smtp.mailfrom=red54.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=uP/qeNq1; arc=none smtp.client-ip=203.205.221.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=Red54.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=red54.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="uP/qeNq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1781088123; bh=THxUI5HGdWNeAk0BiQprECIitxL9bW9uq0FRpOlNpLM=;
	h=From:To:Cc:Subject:Date;
	b=uP/qeNq1zyVhPqZlOeGNwPCJl6Bl6twLsQw1dwFv63AchJFqlPzLAOnR4FUMM6VKc
	 McAekYRrfybX7jzt4XOFwViDMfwdUBWlKyQchfhrpGwmAxHYUsszE0rGHsCixDzjAH
	 nrf9jmmVun5tkwGHUq/zKnel9q3SM9mnHhAlmJMU=
Received: from mail.red54.com ([139.99.8.57])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id A7015426; Wed, 10 Jun 2026 18:41:48 +0800
X-QQ-mid: xmsmtpt1781088108tpswihqzm
Message-ID: <tencent_8BFBEB8F69A01BED468F9275F99FDC335A06@qq.com>
X-QQ-XMAILINFO: M9B5ARjGA2WmEqG3MYFXY82AWf5D2G/GzRSzcxUoBZxBro6sgQDv97YdqoP2+G
	 QyA+8mwYdOYbWX+rWx9Q+PTEc64SNrRGH9eWKZWbREiQF7wBMBuMSzgUYt3EPZ6tFfdXpm4OI6ZH
	 UCKH2w/eVHN8oLCthE/7L4AmM8uz0PUD+TXcNlbA4ESeoRB8O0QQkfOFl3tf92/laQ8SGS+OVbCj
	 e7T9C3ir0XXaIOSua5K9TCp10XEJXIygWJYxexH4g+ZA/FnQzfHBK9wmzbdvPly3Il/qXKdmUXbV
	 UtIFNqYZIBFjjpTHyaol4tVjSuCskAv20l1oXuS6uXGlZqPKwFQPCRFyvkU5drKmHe7E2IlsLTbU
	 fxNhGxgBy50qWQgbY1rF3CPI7bCKkTJkIdJPrHiZ3QkyxNpxok9rN+gJCI4uFFQa+/8P99ijj5NF
	 SHv45eRaTuSuAloeWzV55X9Uz2x1yItO/Or4Rej687jNii7ZhfO6nLFTouypplrDZKYzZni2uww8
	 BRxd9pEC/PdJfpignkiPT7LhYGFVNYXpVYTzOUB/UHL/+is9rGaaNf5ugdgmSUZcxOUdKRRTEwpy
	 dW4OWkE/JPByp6vzS2u648MwhMQkhWn+E3x2J/i4cp0DZw0da71+x0dnb9lqWyIRWGFsF5j3had4
	 dZ+ZFns3talR/qhaEtu5aoaiGfTfApLbsHwwy5UHpl/K6tIBU1AEuthh2BW6XS53TCwA4BkGej5+
	 HB1puS7/BBq59UsXwondo+6DnMFV8KCbVbsO19y8TpzO+FMBhvKuZOIW2lQRpveQ6C+8qyqnkYjf
	 Nk8Kjl7cDTK7gypK528rv+EBDjuMtNRzbB45HgPvt446QFtBrdFpYnEePM5UqqkWqOv1zp1ulMnk
	 wYhL4bZZfRplAgUTXvHZxN+mx9XGEIGAYh+66DaRwx7G5OPlyoWpVzhcEQS4StCwdrj5m6y0NT/I
	 OsfoWOnzmvy6egBAscLfVfntGg4lcepIMaPTtGwRjCz4KDjVxvuESzMN4Fbx6pzDtuoy/ZaGmTsj
	 /ubWWsbh2v5fzip5AFobUx/RZ0/oqWdD4OeYRUuVeWkkfaxoMj6w3EaqdWjP8=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
Sender: yeking@red54.com
From: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>
To: loongarch@lists.linux.dev
Cc: =?UTF-8?q?=E8=B0=A2=E8=87=B4=E9=82=A6=20=28XIE=20Zhibang=29?= <Yeking@Red54.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Youling Tang <tangyouling@kylinos.cn>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] LoongArch: kexec: move struct kimage forward declaration before its first use
Date: Wed, 10 Jun 2026 10:41:30 +0000
X-OQ-MSGID: <20260610104130.123492-1-Yeking@Red54.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

arch_kimage_file_post_load_cleanup() and load_other_segments(), both
inside the CONFIG_KEXEC_FILE block, take a struct kimage pointer before
the forward declaration appears. Move the declaration above so it
precedes its first use instead of relying on a transitive include.

Fixes: d162feec6b6e ("LoongArch: Add preparatory infrastructure for kexec_file")
Signed-off-by: 谢致邦 (XIE Zhibang) <Yeking@Red54.com>
---
 arch/loongarch/include/asm/kexec.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/kexec.h b/arch/loongarch/include/asm/kexec.h
index 209fa43222e1..6be136e9f0a0 100644
--- a/arch/loongarch/include/asm/kexec.h
+++ b/arch/loongarch/include/asm/kexec.h
@@ -41,6 +41,8 @@ struct kimage_arch {
 	unsigned long systable_ptr;
 };
 
+struct kimage;
+
 #ifdef CONFIG_KEXEC_FILE
 extern const struct kexec_file_ops kexec_efi_ops;
 extern const struct kexec_file_ops kexec_elf_ops;
@@ -59,7 +61,6 @@ typedef void (*do_kexec_t)(unsigned long efi_boot,
 			   unsigned long start_addr,
 			   unsigned long first_ind_entry);
 
-struct kimage;
 extern const unsigned char relocate_new_kernel[];
 extern const size_t relocate_new_kernel_size;
 extern void kexec_reboot(void);
-- 
2.52.0

