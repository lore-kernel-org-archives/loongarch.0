Received: from mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDB8380FEB
	for <loongarch@lists.linux.dev>; Thu, 13 Aug 2026 16:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637005; cv=none; b=dtaXW860i6pmeaRIsNXkpLmQS4m2hWp5mBCZvbQYAjHSIvNyj6g+9eookRuoAP2zNXFPs3q8UsH8O0yaoSr387gpJAaMb1ToAY9G9X9f499h5Lwv039X4vZqdE3kA1heY3hQKy0QJ83e5ujEgGVCwvWRSinQcBCnCaOTB2VNDsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637005; c=relaxed/simple;
	bh=TfiVg463NFynci603WWT4ZTChHOhrPxJeP6Z8Zrf2Es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ONihfDMwxewZy/iw58exTxVqgICLEZaEq/AbiMZPtrB9hJ/8akGGcXPXQ5jNSzcO5HPkfCIRgpOy2wxi3AafkcgBSL0cfjPJbk05FlVmk9R3NGWxVkf5EGJulDdi5rmNvbXrcYksRv2u0QS0Gz/QhnG1QOWbPS1G+y4zffnOP94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=df+P0iyd; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="df+P0iyd"
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=TfiVg463NFynci603WWT4ZTChHOhrPxJeP6Z8Zrf2Es=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786637001; v=1; x=1787241801;
 b=df+P0iydAxatDkTrZt4CPpu4/tnJxx7MD2PP2muWf5oIRWwPJy9mbHIsuSfw9tAvGGToQhM4
 DTtvgoQcQ+WZ9zhdOew0XWRytTvkv81shLBDf6N+OwXBy2TxVfyI26s0NeOmIu/9ydI6V5HRtvo
 WJ26KiOslCu5EWb8lfrwXXfk=
X-Envelope-To: loongarch@lists.linux.dev
Received: from localhost (223.70.159.239)
	by smtp.migadu.com with ESMTPS id 86f3e37813a2a36a;
	Thu, 13 Aug 2026 16:03:14 +0000
X-Migadu-Flow: FLOW_OUT
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org
Cc: rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	shuah@kernel.org,
	ardb@kernel.org,
	guodongtai@kylinos.cn,
	kernel@xen0n.name,
	graf@amazon.com,
	liukexin@kylinos.cn,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: Re: [PATCH v4 4/4] selftests/kho: add LoongArch vmtest support
Date: Fri, 14 Aug 2026 00:03:07 +0800
Message-ID: <20260813160307.15130-1-dongtai.guo@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAAhV-H7+1bv6ULPO1+SZ5R=XFxNTh+54rqnYQUAW26kF83kiMg@mail.gmail.com>
References: <CAAhV-H7+1bv6ULPO1+SZ5R=XFxNTh+54rqnYQUAW26kF83kiMg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Huacai,

On Sun, 9 Aug 2026 at 12:16, Huacai Chen <chenhuacai@kernel.org> wrote:
> You never answer me why in your test you should disable i8042 from V1
> until V4. In normal use we use a single kernel for both host and guest.

I owe you an apology: I did not actually understand your question. I
thought the commit message had already explained the reason (the
i8042_flush() panic), so I treated it as answered and never addressed
what you were really asking. Let me answer it directly now.

You are right that this is not just a selftest detail. i8042 is built on
every LoongArch kernel: arch/loongarch/Kconfig selects
ARCH_MIGHT_HAVE_PC_SERIO, and KEYBOARD_ATKBD and MOUSE_PS2 (both default
y) select SERIO_I8042 under it. So your "single kernel for host and
guest" point is correct -- a normal defconfig kernel has i8042 built in.

On the QEMU virtual machine there is no i8042, so PNP finds nothing and
i8042_pnp_init() falls back to probing the i8042 status and data
registers (I8042_STATUS_REG, I8042_DATA_REG) directly. On LoongArch those
registers are memory-mapped, and on the virtual machine they are not backed
by any device, so i8042_flush() takes a page fault and the kernel panics
before userspace. A normal LoongArch defconfig kernel booted as a QEMU
guest hits the same panic -- the "# CONFIG_SERIO_I8042 is not set" in
loongarch.conf is only a workaround to let the KHO selftest boot, not a
fix.

The real fix is separate from the KHO series: make i8042 bail out on
LoongArch when ACPI/PNP does not describe a controller, so the direct-port
fallback never runs. I have prepared that as a standalone patch -- the
relevant hunk is below -- and will send the full patch separately. The
selftest workaround can be dropped once it lands.

diff --git a/drivers/input/serio/i8042-acpipnpio.h b/drivers/input/serio/i8042-acpipnpio.h
--- a/drivers/input/serio/i8042-acpipnpio.h
+++ b/drivers/input/serio/i8042-acpipnpio.h
@@ -1633,8 +1633,14 @@ static int __init i8042_pnp_init(void)
 #else
		pr_info("PNP: No PS/2 controller found.\n");
 #if defined(__loongarch__)
-		if (acpi_disabled == 0)
-			return -ENODEV;
+		/*
+		 * LoongArch legacy I/O ports are memory-mapped and are not
+		 * safely probeable when no controller is present: a direct
+		 * probe faults on the QEMU virtual machine and on any FDT-based
+		 * boot.  Do not fall back to probing them directly; if ACPI/PNP
+		 * did not describe a controller, assume there is none.
+		 */
+		return -ENODEV;
 #else
                if (x86_platform.legacy.i8042 !=
                                X86_LEGACY_I8042_EXPECTED_PRESENT)

Thanks,
George
