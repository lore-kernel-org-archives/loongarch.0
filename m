Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313064;
	b=WuIBkS0ZOPHm5ZAHGC64X1+fWLDhFV4hqLZfbHDJ8mVlWRkZKeiZCD33fX7ibijXsEyD
	 zpIUpSf3nvlMJ6YKhPDf8LOFAWBikB4WDdMIgPlX8tCtL7sTC1axT96UELi12W1glWuUz
	 vvB8xOJ0L0aOiBiZWMiOnEUYhXxRKlakXqB/V5XqAzIMEzpndMib5MYUFyOENYVXWymys
	 LgyuU3RMsmJ1ny7HI860kCLfxTISPOk2LHhXVVn2pdmupkjidYgxAjQQuJby8Oji/MP3N
	 mgjDLxniBIHTItjvV+WyO98gQeOcxwHdYmtH5ZsPC8ljAzqPgx9b0FChD4ei0q8qfiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Gy+owdWhI9aq49SvOXumwy6C5wawdvH/TU7Zgbh6cFQ=;
	b=mmMBLGcm7b/SBuLe4/9tLKZGde8ukDD+eN/nPIz/CtpO0bMngsQOAKSmTuH9zwcGjUb6
	 O7X2klmv0z2zk2yl/rb6tYXA16tQlyIKYkOEiKlNEWblkFZ3tAVqBO0FSm7tJx7uYtr/Q
	 dw+c0fwBUSO39aNxWWb2ie1KFpEVKbx4vlTQKNju6Yv53bOLtaWtUk8QS/qzXduYlO6E1
	 1U4Aa4dAGvVN2KvAQ+2bBzkzkhk4FNlBb/ela4yOGx0qDvMcm9REPWCL9uIQWvU1wS8Rt
	 TLuI/t36TXzQDssuL+7qyy+irR/wDPNjJAPsq8TyFME7abDwVmQkbcJyhb+bABLnAGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gqORsJ04;
	arc=none smtp.remote-ip=209.85.221.71
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0561606A33A
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 12:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0561606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gqORsJ04
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e011829easo1297883f8f.3
        for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 04:17:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313062; x=1794917862; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gy+owdWhI9aq49SvOXumwy6C5wawdvH/TU7Zgbh6cFQ=;
        b=gqORsJ044yc6RuNHtpEJdAmQobaSjkkO23vQoSVrTmClhbNKrv3DqHxDsnjEw3KbqL
         gDApINUvrdE/bSA809JnvONK8JaOaBUDBxKnAyN2kKf1IvFqCJRo8MVCCBJIrE2BYYJm
         iekZzrpM77X8qVGNQmlvG1xddtK6LioRazYpwDH5m6HqnNtL7GDoSOfy7ZwWjmAq90NK
         0JSfeVtaEln32H5/dIpcTWhd8uYaSCtg73MiLMIsQYfe1BMUGjJetd8ZBZ89FdmZSe+h
         EY5ztC13qWgVJspFmHP/5NBl5glEdRBmDmMuT6vr0hpHtzTRAk6Cmod6cWL7xWsPQLdQ
         S4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313062; x=1794917862;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gy+owdWhI9aq49SvOXumwy6C5wawdvH/TU7Zgbh6cFQ=;
        b=IC+12j8NpJ7gKKDWhzEMc9d5RMfIs+H6gw0b1kwMXPfh31ZGvQcyr5s1kFQG6BXFsq
         SB8gt7D/ywfsrJ5eVg+f/EPae4XLCQgjdrd4yGuQw6DwqjGW7e8Po0zitI8TcLIhgK7U
         KB49n8zhJk5PWw+stRGX3ziylKu29zTJ2ZgZZKEzaz6Yfk0A3lV9GKdcyeWN31Yn52eO
         +HIuyVn67WOOKwfTLxQhy5758ih3wVwqYEG7qE03DgrpqHCf9JhZcFTwcBIOMQ6lihGy
         HHhhfayuKim4uCiOjUwNtcyql5rT8+SwPwuvJVUZ25YRJvTf6+fIqUAbcT+X55lQ8Azz
         7u5w==
X-Forwarded-Encrypted: i=1; AL+hErGWujwsySPPf95ajtKjRBPlXmoS+rW8w7+ql8xHOmD7I2NibZIr+5ppzgn0/ZGLcnXJjU31xX6jHvQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z+xgMel3cLQvJXn1z5PufdNyhAHA5LPAt+dOMkC38vdzt6hHHNh
	MJVmLREnkE3G7Oe+Pn3oMJ4D/ctCPQ2vnTMhSPbSyi4UqSp22LdVWhbf8W8DJwspeUUXvUwpYg=
	=
X-Received: from wrxp4.prod.google.com ([2002:a05:6000:184:b0:495:feb9:bf43])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:298d:20b0:48e:202:6718
 with SMTP id ffacd0b85a97d-4982ecf6701mr3321662f8f.25.1794313062387; Tue, 10
 Nov 2026 04:17:42 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:35 +0100
In-Reply-To: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261110121731.2728824-12-ardb+git@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-15-ardb+git@google.com>
Subject: [PATCH v2 03/10] efi/libstub: Avoid _end section marker in library code
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The _end marker could point to the end of the kernel image being loaded,
or to the _end of the zboot decompressor image, and so it should only be
used in code that is obviously only intended for the former case.

So instead, use kernel_memsize and the image address to obtain the same
quantity.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/firmware/efi/libstub/kaslr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/kaslr.c b/drivers/firmware/efi/libstub/kaslr.c
index 8f8dc335b3b3..b34e4599f0f6 100644
--- a/drivers/firmware/efi/libstub/kaslr.c
+++ b/drivers/firmware/efi/libstub/kaslr.c
@@ -125,7 +125,7 @@ efi_status_t efi_kaslr_relocate_kernel(unsigned long *image_addr,
 		if (!check_image_region(*image_addr, kernel_memsize)) {
 			efi_err("FIRMWARE BUG: Image BSS overlaps adjacent EFI memory region\n");
 		} else if (IS_ALIGNED(*image_addr, min_kimg_align) &&
-			   (unsigned long)_end < EFI_ALLOC_LIMIT) {
+			   (*image_addr + kernel_memsize) < EFI_ALLOC_LIMIT) {
 			/*
 			 * Just execute from wherever we were loaded by the
 			 * UEFI PE/COFF loader if the placement is suitable.
-- 
2.56.0.542.g3ef89b7020-goog

