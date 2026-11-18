Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026105;
	b=URaRX2YJ78W6tERyz+XkZ93jiUu+pOmDasQ5yYbcLDSznORaA+95jslmq91/xaJz7fcR
	 JZ4L3vhou5H3guK27be/n45SOgNwIwYyTJ6jdub3jRLSsA6F8QR9NhNip+vz/dRuhBURS
	 crxqqKZ/zlapIJk5h77WRk4KDmnpyIQpLe8Xqls0JUZQdUUce2ihNIhRUaavQCFkmgO41
	 4Ps0APCqIUzgqiFlPGX+7IWTapDNqiBehTYfHK3lC+0OlfGNSZrH2iV4S4RPWNAppmfS8
	 /9QhXi+dxBUTQdQLqC3lM+WfQzh5yDBtc63m81RtT/JEpzgOHsUGaRsucHSOdv8t0vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026105;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Developer-Key:X-Developer-Signature:X-Mailer:Message-ID:Subject:
	 From:To:Cc:Content-Type;
	bh=ltwMOlHQb7KXQHw1z5VBs+MReZmVIy0Qa1qSs/vHRAk=;
	b=p2RftDi7HMaIUAmtj9fUfRvM75WxR07ZYkJWotlNnbSRp3sKExlEKEy3YKy7tpvKmr6U
	 UCbSb868T6E2JBOx6mOCRCfy80r/MWc/K2bUJwxZeRDYB3a/F38IvnGXOPJ12nbPB5St4
	 Uy7wqfMUGde+hqWfr6RLLENK1wr3LufDAEtoiB0Dr+Vpg+tif4MtL9GS34TZ/qvba9jjk
	 ZXlmgEKFEjtjk2+CwhB7vQyBMxBGb5MEKLfxLSkCwd5DtKgdBc/W7BgkYzknAyWrSRxnF
	 MPWJZgcKgt8kvdygOtFXortLFdJbuTsQ/TXPQw9P4lpbx81cNwUq8rJRFliaKndj8fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d1lYrT0q;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3477606A325
	for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 18:21:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3477606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=d1lYrT0q
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4bb6bac1e84so9896955e9.0
        for <loongarch@lists.linux.dev>; Wed, 18 Nov 2026 10:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795026103; x=1795630903; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ltwMOlHQb7KXQHw1z5VBs+MReZmVIy0Qa1qSs/vHRAk=;
        b=d1lYrT0qGW5dR6rNyHf9SQ1jXGrVMazpekxsStuvsRsaiZtXUzopniVsooWAFquYhC
         9CfgR6Uee8sLaL1QLHUFDa6+wmUT3MMp/qegOgn4D/lK+Oag6JRYpj+PJ8wtT0WVzkxY
         ghzeYUZGTGFGIOP+Tsjl5K5coPeHFkob7bGZIzULzBuR5r7b+sbMzE865OBdsv4ergxS
         57CT0r+58suBvs7cT4/bFTEEHFbTa/cTmx3zNdCA/tBvVDmtZSdD6CtUW4c9MxL3vYCe
         CExTgK523/41tGJsAYi+iyBN1qkYvcJ2OW29mF9YZKt/EWby7y1vd1/VG6oDxEN63FSX
         InVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026103; x=1795630903;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ltwMOlHQb7KXQHw1z5VBs+MReZmVIy0Qa1qSs/vHRAk=;
        b=SbvumqQZFEncKr3eHzEhaj4ifKq3CydzOnrLNRSkksFW02Dm85nHarnUhUxer1QnLB
         Hg4pw2hKUJTz3bB5ihT+8IxpBz8jCuh9pLPGBmMVWSwsFpYEx9jRhl89ntWxcX479k2X
         ebMfNywh2SLJ0br6rODVmZ7lvtbqJDI6KLr916TT1S77m0cZdrhBEFYRwz65+B6TzHlc
         REtEsEdY/Tiqes07lb8npjRCUHP0KFmijsCbkQBqKoKrREQLG4qfAnzCTXGAaNgFRenj
         h+Jx3DXwJ3D+Lw3lcfHsQqYdoy+1U3IndKX1XK2BbmVRP/VH8qRtBsfR+QbwvsWD7VWx
         sKVg==
X-Forwarded-Encrypted: i=1; AL+hErHWodtF5R82a31N7fKizUzCgT7+cwzU/gconVpmroqF7rrkSTBA7sxJPq4rIyODdL1KMG9ykxJSnQs=@lists.linux.dev
X-Gm-Message-State: APuU4Z92FSXsxnDdeWEdo9QCSNxg39qBR1aiXkMOyYWmBCx2+SVEALJx
	/B+pXFOkpupE5ktfO92cIWWe1V4LuWN4HT7H+gY2rICLvPHhicfw3HzZC90tc4XOwyPnoSdzIQ=
	=
X-Received: from wrws4.prod.google.com ([2002:a5d:69c4:0:b0:48e:a88:307b])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:b99:b0:4ba:6d8:dfad
 with SMTP id 5b1f17b1804b1-4bb7da1aa22mr67684765e9.14.1795026102835; Wed, 18
 Nov 2026 10:21:42 -0800 (PST)
Date: Wed, 18 Nov 2026 19:21:06 +0100
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=6816; i=ardb@kernel.org;
 h=from:subject; bh=ROU61ckYiXxQPdXaEdC2Y85DXEPZDxapPOtwOwcXvJE=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIevvm0n3E/PsF5oJSmaZ7zQ7bb12mbfH3ITECuZlP6fs8
 rqX7G/SUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACayt53hf3pgxFmdszM57y/e
 kn9woU3P23jXKe295fNV4zvfrnqxpIzhf36HyiuW8xZpxfw58kdKSiYo7tr7RvHDjatuUjax75Z U8gIA
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <20261118182105.1633603-21-ardb+git@google.com>
Subject: [PATCH v4 00/19] efi: Expose loaded image properties via info struct
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

Changes since v3:
- Populate efi_image_info for ARM correctly
- Fix a pre-existing issue in the ARM allocation logic
- Simplify the prototype of handle_kernel_image()
- Pass image_info pointer down to efi_kaslr_relocate_kernel() and
  simplify the callers
- Align RISC-V's __inittext_end correctly so it can be remapped.
- Add some more acks from Jason

Changes since v2:
- Add some additional fixes for RISC-V, which deviates from other
  architectures wrt its section markers. These patches have been sent
  out separately as well [0] as they will likely be taken through the
  RISC-V tree.
- Pass an efi_image_pointer to efi_stub_common() that points to the
  version inside the loaded image, so that its relative references
  accurately describe vmlinux in memory before boot.
- Avoid weak linkage hacks to derive the kernel entrypoint, and instead,
  always use the entrypoint passed via efi_image_info
- Use efi_image_info for sysfb_display_info so that efifb earlycon works
  much earlier on zboot
- Drop changes related to the previous bullet that are now no longer
  needed
- Add acks from Jason

Changes since v1:
- drop arm64 image header changes
- move efi_image_info out of __efistub_ scope so it can access vmlinux
  symbols directly
- implement in a generic manner for all architectures that support zboot
- address Sashiko comments

[0] https://lore.kernel.org/all/20261111164345.4059964-5-ardb+git@google.com/

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev
Cc: linux-riscv@lists.infradead.org
Link: https://lore.kernel.org/all/0-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com/

Ard Biesheuvel (19):
  efi/zboot: arm64: Add missing barrier after cache maintenance
  riscv: Use _stext not _text to denote the start of kernel code
  riscv: Make _text point to the start of the kernel image
  efi/riscv: Rename __init_text_end to __inittext_end like other archs
  efi/libstub: Avoid _end section marker in library code
  efi/libstub: arm: Size the decompressed kernel allocation precisely
  efi/libstub: Avoid reserve_addr/_size in efi_kaslr_relocate_kernel()
  efi/libstub: Capture loaded image information in struct efi_image_info
  efi/libstub: Pass kernel entrypoint down to efi_enter_kernel()
  efi/libstub: arm: Simplify handle_kernel_image()
  efi/libstub: Drop reserve_addr/_size params from handle_kernel_image()
  efi/libstub: arm64: Use struct efi_image_info to access image
    properties
  efi/libstub: loongarch: Use struct efi_image_info to access image
    properties
  efi/libstub: riscv: Use struct efi_image_info to access image
    properties
  efi/libstub: Make efi_remap_image() return efi_status_t
  efi/zboot: Disentangle efi_remap_image() from efi_cache_sync_image()
  efi/libstub: arm64: Drop zboot code_size hack
  efi: Make config table based primary display handover ARM-only again
  Revert "efi: earlycon: Reprobe after parsing config tables"

 arch/arm/boot/compressed/head.S                      |  3 +-
 arch/arm/include/asm/efi.h                           | 15 +---
 arch/arm/kernel/efi.c                                | 27 ++++++
 arch/arm64/boot/Makefile                             |  3 -
 arch/arm64/include/asm/efi.h                         |  2 -
 arch/arm64/kernel/efi-header.S                       |  2 +
 arch/arm64/kernel/image-vars.h                       | 14 ---
 arch/loongarch/kernel/efi.c                          | 20 +----
 arch/loongarch/kernel/head.S                         |  4 +-
 arch/loongarch/kernel/image-vars.h                   |  6 --
 arch/loongarch/kernel/vmlinux.lds.S                  |  1 -
 arch/riscv/include/asm/efi.h                         |  2 -
 arch/riscv/include/asm/sections.h                    |  2 +-
 arch/riscv/kernel/head.S                             |  1 +
 arch/riscv/kernel/image-vars.h                       |  8 --
 arch/riscv/kernel/setup.c                            |  2 +-
 arch/riscv/kernel/vmlinux.lds.S                      |  6 +-
 drivers/firmware/efi/earlycon.c                      | 16 +---
 drivers/firmware/efi/efi-init.c                      | 24 +-----
 drivers/firmware/efi/efi.c                           |  5 --
 drivers/firmware/efi/libstub/Makefile                |  3 +-
 drivers/firmware/efi/libstub/Makefile.zboot          | 11 ++-
 drivers/firmware/efi/libstub/arm32-stub.c            | 90 +++++++++++++++-----
 drivers/firmware/efi/libstub/arm64-stub.c            | 37 ++------
 drivers/firmware/efi/libstub/arm64.c                 | 23 +----
 drivers/firmware/efi/libstub/efi-stub-entry.c        | 33 +------
 drivers/firmware/efi/libstub/efi-stub-helper.c       | 15 ++--
 drivers/firmware/efi/libstub/efi-stub.c              | 26 ++++--
 drivers/firmware/efi/libstub/efistub.h               | 84 +++++++++++++-----
 drivers/firmware/efi/libstub/fdt.c                   |  5 +-
 drivers/firmware/efi/libstub/image_info.S            | 19 +++++
 drivers/firmware/efi/libstub/kaslr.c                 | 45 +++++-----
 drivers/firmware/efi/libstub/loongarch-stub.c        | 21 ++---
 drivers/firmware/efi/libstub/loongarch-stub.h        |  4 -
 drivers/firmware/efi/libstub/loongarch.c             | 11 +--
 drivers/firmware/efi/libstub/primary_display.c       | 56 ------------
 drivers/firmware/efi/libstub/riscv-stub.c            | 29 +------
 drivers/firmware/efi/libstub/riscv.c                 | 16 +---
 drivers/firmware/efi/libstub/zboot-decompress-gzip.c |  2 -
 drivers/firmware/efi/libstub/zboot-decompress-zstd.c |  2 -
 drivers/firmware/efi/libstub/zboot.c                 | 28 +++++-
 drivers/firmware/efi/libstub/zboot.lds               |  6 +-
 include/linux/efi.h                                  |  1 -
 43 files changed, 324 insertions(+), 406 deletions(-)
 create mode 100644 drivers/firmware/efi/libstub/image_info.S
 delete mode 100644 drivers/firmware/efi/libstub/loongarch-stub.h
 delete mode 100644 drivers/firmware/efi/libstub/primary_display.c


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.1.708.g77570a6a1d-goog

