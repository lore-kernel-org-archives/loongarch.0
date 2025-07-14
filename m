Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7434D217F35
	for <loongarch@lists.linux.dev>; Mon, 14 Jul 2025 06:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752473458; cv=none; b=Ax60RrAsY3ms5r84eHRP+huY+Dn5jsrnuVZJ5fRfRh1DP3HNU+2GlbWGPIFexxRZxDYIQ4BpWMc1DpwTMwAORXn5qtdwlnDBKPcduAEpqMGM+2v3UR2B5krNFYWCMUALpztL6O0cjDAF4Y/zJhO/0tmD4AEdZxmIiuF475A6oxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752473458; c=relaxed/simple;
	bh=r3qINUs4GQGQK0KeSYb9XwtihHPTH4GAfxB3icQZeXg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=e06h/CbCERxDHz7LjWMYzTnIdpkkEgSux1l8CKNfwXveiMcxb09rBN9NHuby5G/YCgzDSl266f1PrGaxaORkekQDY7ZsC19maRqys8OzdQnz0vqdkHc1Nis+1I7HKy3s7Qiu0ZyHHMXhH1XeRofU48zozbL9GrkFEbjeZ9jcT5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=drI5P4VN; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="drI5P4VN"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-60785c45274so2846158a12.2
        for <loongarch@lists.linux.dev>; Sun, 13 Jul 2025 23:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752473455; x=1753078255; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G9Tn70FKTpBDzek73ufnJv469R3NOa6ous5bCCu5m1U=;
        b=drI5P4VNRLB98vmAvTKMDoX5PbBHF0n1Gd7+pPZdpnbhAg6lodx07dDQwTLHk9k/+M
         k8Cf5BRW5ivm0euLGOzlpRgLNfiAq86eM71EAI9dWUJJNT7WN2m+2JI9sf+cU3gF3G/1
         K5NWuRarIUX7KSiRMUrWU41AgvDJ3El+AOYg2VbJPWAxMQW2+Uawx5b82ZkbreFCq3LF
         GaQYqjMZvTxMOheAuY3rjXoK9C8yKbVt2GEzNAP0Tq2JzZXLM8wi+F2gqjoFG0GMvAln
         +9npw/0WIew9dDmVeLlHzSuu6FO94RAqe9b56XUtvTUfsXchtUqzG8zyZ2QMdHAq6T2y
         4oPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752473455; x=1753078255;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9Tn70FKTpBDzek73ufnJv469R3NOa6ous5bCCu5m1U=;
        b=fPkL2wqZjxyvvISI1vyHmDUftORHeh1WSE6/PAwrrqbojA45ir5GwMA9N5QXmT+x3S
         uJWHl5ARAPnCNy8dxcCF7ubfPznaoNL22p59KQsg0vFddeGzllVmiWbWG5g1QPK0gGk+
         MWgMzUzFqaPSSwlpA8UMvX83bAtGrXYQA83qUwPkaWrEf2MeFlkfsc3ZyPTJpQ0Z8C98
         b8BCRi07KRqtKYC/UUBO9ZbI2dF2tw2SlPe57JxWBcBRGAsOZK1R7ksHdTqDqZ+EbyDv
         b7u7cDdDFps973CjI7hgNru3Orybe05QJafWT7PGYg4jWqvA+pytsVGiIrejlTnaSM7m
         IvSg==
X-Forwarded-Encrypted: i=1; AJvYcCUT/MR5JGQj1r3wmdycd0V2oJUv5Dl1Ok5xVv0cdpjFaZ9/ax/cIlhSR0WSAnWRn0ymnQ5mJRcBmR8=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywr09VeTzNGFgeuNIXcXXw9YAaJtaw3Qz7joFVAAaY+/fvS5xxh
	0fx7/A9kFMq5Jf92iMMF4T1VfEW5C3WKeS1Cdg7bAUnM6J78+XsF/koJ54tYBtdBhZ78DsOm5Q=
	=
X-Google-Smtp-Source: AGHT+IHnMYU1tdLUgCWCMkDHtV2ofJo8Kj1jhtO5SeCzNxOoPrZb9dQJqddWyqsdiNjGgTivJJ6PBrvn
X-Received: from edbec48.prod.google.com ([2002:a05:6402:d70:b0:612:b2a:492f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2551:b0:60c:6c85:48dd
 with SMTP id 4fb4d7f45d1cf-611e84d5ce0mr9692143a12.23.1752473454949; Sun, 13
 Jul 2025 23:10:54 -0700 (PDT)
Date: Mon, 14 Jul 2025 08:08:44 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2042; i=ardb@kernel.org;
 h=from:subject; bh=lBZw99MDLRGQYnmUAEaW8S2w5GuCP7F3IekTWgHFi6g=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIaNk3vvT+9Y9uuM3TXFJnJtsxIyzqcz/eR/PsPqzeEKNP
 R/foYsSHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiJ5gZGS5KK9wuT5s0Q+Ja
 CftM/4wbF554nvlzf3ftBpG1fNZ/k0QY/nDa+K/0XKev99bz53mu6oadcpenx9Ud4TpWE21YcXy aJQ8A
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714060843.4029171-5-ardb+git@google.com>
Subject: [RFC PATCH 0/3] Remove unused EFI runtime APIs
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Bibo Mao <maobibo@loongson.cn>, linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Using EFI runtime services to program the RTC to wake up the system is
supported in theory, but rarely works in practice. Fortunately, this
functionality is rarely [if ever] used to begin with so we can just drop
it. (Note that the EFI rtc driver is not used by x86, which programs the
CMOS rtc directly)

The same applies to GetNextHighMonoCount(), which, if implemented,
usually relies on SetVariable() under the hood *, which is often not
supported at runtime by non-x86 platforms. But it has no known users
either so let's drop support for it as well.

This means we need to drop the slightly pointless tests for it too.

* EDK2 based EFI implementations usually have a MTC variable carrying
  the monotonic counter variable, which is therefore not truly
  monotonic, given that SetVariable() will happily overwrite it. 

Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com> 
Cc: Sunil V L <sunilvl@ventanamicro.com>
Cc: Bibo Mao <maobibo@loongson.cn>
Cc: linux-rtc@vger.kernel.org
Cc: linux-efi@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: x86@kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: loongarch@lists.linux.dev

Ard Biesheuvel (3):
  efi-rtc: Remove wakeup functionality
  efi/test: Don't bother pseudo-testing unused EFI services
  efi: Remove support for pointless, unused EFI services

 arch/x86/platform/efi/efi_64.c          |  22 ----
 drivers/firmware/efi/runtime-wrappers.c |  68 ------------
 drivers/firmware/efi/test/efi_test.c    | 108 +-------------------
 drivers/rtc/rtc-efi.c                   |  76 +-------------
 drivers/xen/efi.c                       |  56 ----------
 include/linux/efi.h                     |   6 --
 6 files changed, 4 insertions(+), 332 deletions(-)

-- 
2.50.0.727.gbf7dc18ff4-goog

