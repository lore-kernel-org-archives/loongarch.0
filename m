Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F9829B777;
	Tue, 16 Dec 2025 10:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765880823; cv=none; b=ZA9+jkdmI2bQGYpWqoMyk0wDHJLq4I5ojZ2FV6l5bTXbJEutFJAlk5dxyFkZ5mz05Z6xPgv2Ah8AOL39LM8BzZO1flsl+ysiJ//ZgX8XZTlB/DXRSRjzlhm/JYXAm7qgvUGM5FA5jDDhftlpGMqVZq9IXfL98CgZ//t4798cJWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765880823; c=relaxed/simple;
	bh=PC8f1RAbSk6nfJLcg52v2VKA29odkPLz1y14R8tIMXw=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=eirNTc2vkOOgYXKGt+2aFaLMVQEByBI9cDEaP1wdEq9BgBMwH2Ic0n8TEuoKzBj9xJZsn1EtMUDSBDnIh7K/LDmFPZAZFGeE9MlHV9PPx5k/XDkmNSUc2uF72XiE6/pra/f/Ekob/j3bR5wCjsfi6qLuuisKbLD1rjv4MKFwDkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fAvjIpE2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fAvjIpE2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC766C4CEF1;
	Tue, 16 Dec 2025 10:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765880823;
	bh=PC8f1RAbSk6nfJLcg52v2VKA29odkPLz1y14R8tIMXw=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=fAvjIpE2hAllw5MZvvIVIalkuHiP0rU+48q2SN1kDAnLF6FzBUf13/jKyzd8Oe46y
	 77MhTuNANSSc9JmarxqN1DZO0TM2KyaElt/hpnS3SNPGKqIjz6BLpsUa4A/ixAdFpx
	 fLhj52U7hakdV/aRU8EcsGb4uy7RZYtxV5K9lRy8=
Subject: Patch "[PATCH 6.12] LoongArch: Add machine_kexec_mask_interrupts() implementation" has been added to the 6.12-stable tree
To: chenhuacai@kernel.org,chenhuacai@loongson.cn,gregkh@linuxfoundation.org,kernel@xen0n.name,loongarch@lists.linux.dev,sashal@kernel.org,zhangtianyang@loongson.cn
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 16 Dec 2025 11:26:59 +0100
In-Reply-To: <20251213094950.1068951-1-chenhuacai@loongson.cn>
Message-ID: <2025121659-pantyhose-karate-1504@gregkh>
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

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     loongarch-add-machine_kexec_mask_interrupts-implementation.patch
and it can be found in the queue-6.12 subdirectory.

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

queue-6.12/loongarch-add-machine_kexec_mask_interrupts-implementation.patch
