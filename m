Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D67328612;
	Tue, 16 Dec 2025 10:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765880794; cv=none; b=ubt4+Xk3Rkkqx6XL4aQtTW1sFb9jTgD7A/Ttv0si7sPCFGvi2q2AZXTe/UAZUaBwqAznHnm7abHyVsZ2XFXHNOXjgh4Ga28QrLbTK8aD1hsID+Gw+8O31Qbu0gh9tnbJ2NbULI2jgmAYgmF/cUHzuBVgqrc8dkNmtfkt1/lUKuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765880794; c=relaxed/simple;
	bh=UxYRxWJNC2oRjTrOt/ki1iEtGTpP5CCHvKMOdA8xJbI=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=V5SFqWE9Q2yF6JeLPKyX6uSeszJk2OnEbZDSfXT36f2/Geobz4prIzakptqosP35dxU13eytQVk5cgLv6+TjuM+CqTNjIV/VZ3FXhZRsINxFLB6qYqjfwul6+wb4iV4BQ6lpEW55hvGsTqpXFNFDOFm0f+DgihASv4/A9rVbfQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=G5NfJeFb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="G5NfJeFb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5523C4CEF1;
	Tue, 16 Dec 2025 10:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765880794;
	bh=UxYRxWJNC2oRjTrOt/ki1iEtGTpP5CCHvKMOdA8xJbI=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=G5NfJeFb40yMTwIe07mBK+JiNEXJu8lQlN1roAq1admlB/jB2uca86q7xo+QT2Btl
	 OYHM6xK4Bir3Z6cxPtgmkJ7v6VwqlzEZxs8jTbzm2dOXRwmCNuG+NuDmzZX11K9cGT
	 HsKwNx296VnLH3dap/L7hb6Jz9nXUHZnY+xrKuF4=
Subject: Patch "[PATCH 6.12] LoongArch: Add machine_kexec_mask_interrupts() implementation" has been added to the 6.1-stable tree
To: chenhuacai@kernel.org,chenhuacai@loongson.cn,gregkh@linuxfoundation.org,kernel@xen0n.name,loongarch@lists.linux.dev,sashal@kernel.org,zhangtianyang@loongson.cn
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 16 Dec 2025 11:26:31 +0100
In-Reply-To: <20251213094950.1068951-1-chenhuacai@loongson.cn>
Message-ID: <2025121631-congenial-tidings-5192@gregkh>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    [PATCH 6.12] LoongArch: Add machine_kexec_mask_interrupts() implementation

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     loongarch-add-machine_kexec_mask_interrupts-implementation.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From chenhuacai@loongson.cn  Tue Dec 16 11:19:39 2025
From: Huacai Chen <chenhuacai@loongson.cn>
Date: Sat, 13 Dec 2025 17:49:50 +0800
Subject: [PATCH 6.12] LoongArch: Add machine_kexec_mask_interrupts() implementation
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, Huacai Chen <chenhuacai@loongson.cn>, Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <20251213094950.1068951-1-chenhuacai@loongson.cn>

From: Huacai Chen <chenhuacai@loongson.cn>

Commit 863a320dc6fd7c855f47da4b ("LoongArch: Mask all interrupts during
kexec/kdump") is backported to LTS branches, but they lack a generic
machine_kexec_mask_interrupts() implementation, so add an arch-specific
one.

Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/loongarch/kernel/machine_kexec.c |   22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

--- a/arch/loongarch/kernel/machine_kexec.c
+++ b/arch/loongarch/kernel/machine_kexec.c
@@ -136,6 +136,28 @@ void kexec_reboot(void)
 	BUG();
 }
 
+static void machine_kexec_mask_interrupts(void)
+{
+	unsigned int i;
+	struct irq_desc *desc;
+
+	for_each_irq_desc(i, desc) {
+		struct irq_chip *chip;
+
+		chip = irq_desc_get_chip(desc);
+		if (!chip)
+			continue;
+
+		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
+			chip->irq_eoi(&desc->irq_data);
+
+		if (chip->irq_mask)
+			chip->irq_mask(&desc->irq_data);
+
+		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
+			chip->irq_disable(&desc->irq_data);
+	}
+}
 
 #ifdef CONFIG_SMP
 static void kexec_shutdown_secondary(void *regs)


Patches currently in stable-queue which might be from chenhuacai@loongson.cn are

queue-6.1/loongarch-mask-all-interrupts-during-kexec-kdump.patch
queue-6.1/loongarch-add-machine_kexec_mask_interrupts-implementation.patch
