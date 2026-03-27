Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B54C2F5498;
	Fri, 27 Mar 2026 09:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603435; cv=none; b=X270wkKT8wVinPoLurJlTPz1WDIEOpx3lJr4zgmlhUQhqpWwb0xjO1hQYB0EvoGfu0IMruRhvNg+wSKDYqWuQAZUZa08a5FrZ4Lim3xtK1k/m73ynDkV3DndAlxrvzD64MrHIg3FDjaYCyKntVLpq6xP5MGTwwV+94M02hh9H/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603435; c=relaxed/simple;
	bh=6wbqUy0KSLcvz1aAQfS1C5Asosv+W6NiMq42i9QkrQY=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=MPpThJT75kYdPvunsyJtM3LLEBOLfVduywSdlrF8ZOVa5t7TmhWxS9/V1qnPlMgr2V6tMyuh/B3bXKUGn+V9BWLt8g/haMXQvoSfwJG7FykThx/MuLTpPpx7/5owNebSXGWmeV7/7pjG8GZgSMG9b2FKxy8oQK7987rXyoqe+ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UVXmCiGI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UVXmCiGI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805ECC19424;
	Fri, 27 Mar 2026 09:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774603434;
	bh=6wbqUy0KSLcvz1aAQfS1C5Asosv+W6NiMq42i9QkrQY=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=UVXmCiGIfM9P4Td6T+3exckEbuDLDx211h6f1N9dYYu8JfTl6TW6rNdhnbYasH3LY
	 E5u/VHYvzlKfqAxV1P1nsl1CWPn/awNXcKgjuQKlHjSMrMG0HKRSQkVYJll/IvYXJz
	 l/2CLiWl4/E1LCZyXxAirNJJHrmcrw9ry6nisPTA=
Subject: Patch "Revert "LoongArch: Add machine_kexec_mask_interrupts() implementation"" has been added to the 6.12-stable tree
To: chenhuacai@kernel.org,chenhuacai@loongson.cn,gregkh@linuxfoundation.org,kernel@xen0n.name,loongarch@lists.linux.dev,sashal@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Fri, 27 Mar 2026 10:23:31 +0100
In-Reply-To: <20260327084701.2692699-1-chenhuacai@loongson.cn>
Message-ID: <2026032730-hunter-jab-0338@gregkh>
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

    Revert "LoongArch: Add machine_kexec_mask_interrupts() implementation"

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-loongarch-add-machine_kexec_mask_interrupts-implementation.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From chenhuacai@loongson.cn  Fri Mar 27 10:20:19 2026
From: Huacai Chen <chenhuacai@loongson.cn>
Date: Fri, 27 Mar 2026 16:47:01 +0800
Subject: Revert "LoongArch: Add machine_kexec_mask_interrupts() implementation"
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, Huacai Chen <chenhuacai@kernel.org>
Cc: Xuerui Wang <kernel@xen0n.name>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, Huacai Chen <chenhuacai@loongson.cn>
Message-ID: <20260327084701.2692699-1-chenhuacai@loongson.cn>

From: Huacai Chen <chenhuacai@loongson.cn>

This reverts commit 429bf3f04c24a1590ed18cd7bf802cf63f937a0f.

6.12.78 backported "kexec: Consolidate machine_kexec_mask_interrupts()
implementation" so the arch-specific implementation is redundant.

Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/loongarch/kernel/machine_kexec.c |   22 ----------------------
 1 file changed, 22 deletions(-)

--- a/arch/loongarch/kernel/machine_kexec.c
+++ b/arch/loongarch/kernel/machine_kexec.c
@@ -136,28 +136,6 @@ void kexec_reboot(void)
 	BUG();
 }
 
-static void machine_kexec_mask_interrupts(void)
-{
-	unsigned int i;
-	struct irq_desc *desc;
-
-	for_each_irq_desc(i, desc) {
-		struct irq_chip *chip;
-
-		chip = irq_desc_get_chip(desc);
-		if (!chip)
-			continue;
-
-		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
-			chip->irq_eoi(&desc->irq_data);
-
-		if (chip->irq_mask)
-			chip->irq_mask(&desc->irq_data);
-
-		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
-			chip->irq_disable(&desc->irq_data);
-	}
-}
 
 #ifdef CONFIG_SMP
 static void kexec_shutdown_secondary(void *regs)


Patches currently in stable-queue which might be from chenhuacai@loongson.cn are

queue-6.12/revert-loongarch-add-machine_kexec_mask_interrupts-implementation.patch
