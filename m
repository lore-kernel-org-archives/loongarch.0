Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313061;
	b=VaOjIjhETck9ImMfdF9IplRU9Q3oJzwLvA+4qo1WI1s/C+wRPWMF4fJML7m40C5orM1Z
	 ZmWSNgbXJJIXk3xqHkn+4qK76pDD0RXNP0Vsts3uTTmYl1gjt+tefTHVF80ZGdla/nm5q
	 GxlWIMu4sif/6/1/CX8IWF0SNvxIuflPtYQfwt7Dodl/KFW8VQCrscSLhvbGfjkV8L/Nr
	 sDh7Po+8+x3bUa4BGh4qjiq5yy7LXqus2iAdeAGRvvrMsG3tOdD2irfmqzlAQJiZ2VarQ
	 HI/JdgeRQPWNhV+qN1nsaJq6j5mScrRooTS14qbraKO5A37R7nA7KTMalw3ho0OGYig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313061;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=QyX/bokU0mEshftPogmAYinbZSTYIiyRguYJfdW7HHU=;
	b=vMYlC4mlyfX8O+u/Xzh8/LpHqBhdoNWXxB3KXRFj5ycScfxPVEIYrKvuZj9kSc5CygBe
	 seOn83/y18/Cfq+e6VQYi8VW7QVeUSoWdBEbwYjKVV/otrCpudW344gtSGZyml16XAw/N
	 DkXkYG18NpFeWHZJ8ocxItrBbksZwUnOnaegY2b55j5dtDTZVHBvqLEwR3PScV4TxLWwb
	 pj1JySaEaj2gLs3q0tiISmh5iRhxilExmzNadG1hQFjwrHoK65YZobRyWyFvLyyCMr71S
	 bAio+S1oKmicmhTLpa2LYhllU36Db0Wias9jd7vFp0o6ieL7TRtCFEIMfoonY9EDNxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UN42nVSh;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8118606A31C
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 12:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8118606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UN42nVSh
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso15391925e9.3
        for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 04:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794313059; x=1794917859; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QyX/bokU0mEshftPogmAYinbZSTYIiyRguYJfdW7HHU=;
        b=UN42nVShHmo3e+Iwfk5oif7KUZAYq6H3IxH2TtISEm4eGusqRJ3tBUWt4dR1p5XMnT
         sECY6wjE27Y3aZuEmoKPohXLBL2TsVR/Io6T+6dVkTLN+1LLqc6EBeNjZ+EWx4Ufk1wy
         GTBljs8kOR1NQwb7Nv3+F5RLXJXVL5F6gqCF+kLtVcRKAI6QMcnB60+J7AvH6itfZzEM
         QTJcoDtjb/7i4jGm09b8t2JxBBHrs0I6a7OWVgN3wSZEEijzq9B4GyNqzyQZfw+ESYQk
         H1vaZNKaVEUCyfk2A7j/F4VrrEFUhIdJa9EHFU5HoPharvSAfkt36VltjhL0D3Ilon9a
         3y1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313059; x=1794917859;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QyX/bokU0mEshftPogmAYinbZSTYIiyRguYJfdW7HHU=;
        b=etV9BmGf6ICFWGNVG66AOD9m+I0qGSu90yXps+qM2pop4gnLSFTqf9xg0fJw7OsK4x
         aFcNYH4bGuI26j4YxHUq/JJ5ZpoS8BBkA+3ECyRCZp7dGr7dxr8Ha/UkpAUbmuenzhwe
         8WVpSgV0NpCgLxsktvbvJw69wf5aLapnH+27uN/q6SY/3DROVWUgu+0CV3ryA8YmSp7K
         LTcP8TCC9pPo0q4Iuu49bbmK/1cseTNwd/y/OlBPnsfEO5CmB6Jng89U9KQqkPHj4Pan
         MnOse+6JYHzaafK+VSP4RKs9NrDlCLKs+5ISMDL3tTeLHgYOlJcBIkvnydPc6wpSduEv
         64pg==
X-Forwarded-Encrypted: i=1; AL+hErEIGIuzh0N1BlsMo7tfEp5TVI1xpmERZABsXiruTDK+Ltc+BqnFmsdP83exSBR1z4nZGoGir1vxU3A=@lists.linux.dev
X-Gm-Message-State: APuU4Z8ROKaYQQn+M2GqGroxsuQc+WxFtKWboJsqf16NIEpYX+c2el+a
	FejYq+0WkR9BoCQ8E/7KsczuYu4BPK1vzuayRM9+l0G5MhFgUBIqE4SJIu1g/yLhXWlAuK6NXw=
	=
X-Received: from wmcq4.prod.google.com ([2002:a05:600c:c104:b0:4b8:b187:f0cd])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4584:b0:4a2:c2b:a91b
 with SMTP id 5b1f17b1804b1-4ba0233bd35mr40801345e9.10.1794313058867; Tue, 10
 Nov 2026 04:17:38 -0800 (PST)
Date: Tue, 10 Nov 2026 13:17:32 +0100
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261110121731.2728824-12-ardb+git@google.com>
Subject: [PATCH v2 00/10] efi: Expose loaded image properties via info struct
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-efi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Jason Gunthorpe <jgg@nvidia.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Clean up the arm64 build script and linker hacks that zboot uses to
obtain properties of the loaded image (which it cannot access directly
via a relative reference like the ordinary EFI stub).

Instead, define a generic struct efi_image_info, and expose its offset
in the loaded image in a similar manner, but without relying on explicit
linker script exports.

Populate the struct with section markers that all architecture use for
loading the kernel image at boot, so that all the linker exports can be
dropped for them.

Changes since v1:
- drop arm64 image header changes
- move efi_image_info out of __efistub_ scope so it can access vmlinux
  symbols directly
- implement in a generic manner for all architectures that support zboot
- address Sashiko comments

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev
Cc: linux-riscv@lists.infradead.org
Link: https://lore.kernel.org/all/0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com/

Ard Biesheuvel (10):
  efi/zboot: arm64: Add missing barrier after cache maintenance
  efi/riscv: Rename __init_text_end to __inittext_end like other archs
  efi/libstub: Avoid _end section marker in library code
  efi/libstub: Capture loaded image information in struct efi_image_info
  efi/libstub: arm64: Use struct efi_image_info to access image
    properties
  efi/libstub: loongarch: Use struct efi_image_info to access image
    properties
  efi/libstub: riscv: Use struct efi_image_info to access image
    properties
  efi/libstub: Make efi_remap_image() return efi_status_t
  efi/zboot: Disentangle efi_remap_image() from efi_cache_sync_image()
  efi/libstub: arm64: Drop zboot code_size hack

 arch/arm64/boot/Makefile                             |  3 --
 arch/arm64/kernel/efi-header.S                       |  2 +
 arch/arm64/kernel/image-vars.h                       | 10 ----
 arch/loongarch/kernel/head.S                         |  1 +
 arch/loongarch/kernel/image-vars.h                   |  1 -
 arch/riscv/include/asm/sections.h                    |  2 +-
 arch/riscv/kernel/head.S                             |  1 +
 arch/riscv/kernel/image-vars.h                       |  5 --
 arch/riscv/kernel/vmlinux.lds.S                      |  4 +-
 drivers/firmware/efi/libstub/Makefile                |  1 +
 drivers/firmware/efi/libstub/Makefile.zboot          | 11 ++++-
 drivers/firmware/efi/libstub/arm32-stub.c            |  3 ++
 drivers/firmware/efi/libstub/arm64-stub.c            | 20 ++++----
 drivers/firmware/efi/libstub/arm64.c                 |  8 ++--
 drivers/firmware/efi/libstub/efi-stub-entry.c        | 10 +++-
 drivers/firmware/efi/libstub/efi-stub-helper.c       | 15 ++++--
 drivers/firmware/efi/libstub/efi-stub.c              |  3 +-
 drivers/firmware/efi/libstub/efistub.h               | 48 ++++++++++++++++++--
 drivers/firmware/efi/libstub/image_info.S            | 12 +++++
 drivers/firmware/efi/libstub/kaslr.c                 |  2 +-
 drivers/firmware/efi/libstub/loongarch-stub.c        |  4 +-
 drivers/firmware/efi/libstub/riscv-stub.c            | 14 +++---
 drivers/firmware/efi/libstub/zboot-decompress-gzip.c |  2 -
 drivers/firmware/efi/libstub/zboot-decompress-zstd.c |  2 -
 drivers/firmware/efi/libstub/zboot.c                 | 29 +++++++++++-
 drivers/firmware/efi/libstub/zboot.lds               |  6 +--
 26 files changed, 150 insertions(+), 69 deletions(-)
 create mode 100644 drivers/firmware/efi/libstub/image_info.S


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.542.g3ef89b7020-goog

