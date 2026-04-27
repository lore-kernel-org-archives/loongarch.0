Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A9439B495
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 08:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279193; cv=none; b=o0d4fpfRqmOCwLbuGOrG9lcb7zSijbHBT291NBa2s3N36PB3HxDFFHpaOxP4Oy7hE1FfD/2A/NZM8IYF4TKqf6IrTZ7waVQl56QjIdltcjkR1dFq5w6BCNUtZQ0j7+iALYti76aBbCOlyKguTkfvJ2F4ow2OC+3Xety4yQKo88k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279193; c=relaxed/simple;
	bh=8VkYf4oej+1NJIsr42kCIdqMEirKvkfOijKLfIgkJYE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i2lEzal4jmvGaawhE1/lLKrBVzC2b2xmvVkxD4i9FkwWEh7t8/zeSfJ9TGLQObSl8DgLrJGdLR4PuwvNlarqy8+abtXttPRjH0mZpZ39jGE0VTzG3nMBfdqU0/O9oomRvpbHqeGD7Szu67U0Qy2oeLIHgDq6F92TgQGrP1LHJPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=EQ3rvrqg; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="EQ3rvrqg"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-358ed696623so4385045a91.0
        for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 01:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777279191; x=1777883991; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l2khddAE4U1nIPfkSKNCb9MwtuVNtnWHE+Vf+vbXZFk=;
        b=EQ3rvrqg0bb3Hss9+zdfXwk/3L1QxpaU6MZpzXxbbBzn2hzSOAPtLJv7U0diQV/J9Q
         i6Dp+Kl6WPP8CESN7XaIS0fmK/H20uZ1+RWF68RcsLhmsL8EvGcHDHTXKqk4hu6FazdM
         f0/mc7ljAckacKW6DEkn6naY/rgL/yEbw+iNIZQhZM0yc+FuMOHRB/N4NuRyUVTizyF8
         tc+Db5rjUW5LJENfBWqBKamBzrJ03Dsbn+Erj2w7kkt4qOLXjPhPl0aZsY/2ONYm/PdS
         lhvUnjyh85IgUkGE76vZxMj7kbS+iBxpBnd7OWs2axib3/qod0eDaNgfCVl4tbcYVkTQ
         B6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777279191; x=1777883991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2khddAE4U1nIPfkSKNCb9MwtuVNtnWHE+Vf+vbXZFk=;
        b=gGbwmnezwRUFmGIbRlLG2tKM1BzPLhTAbzmi3wUX+G+DPba7M0DTAfndVK8WZntCms
         3OyCggz5c7KLqe1SDWamukMa5NVz5ERlSwySSDL1ETkiJ2xwuwrJinJStOmeiC/lQYhk
         RQLS+4H5vBNMtZbZyzzqG1Zq5qOrEB/+vt+Vkq/oA4bmuOoXwNMr1B5ChuZMHzysNSF4
         AX51svvY7Nnsn5xYYIx1WqpMtJGKRRHyPj1JeNfOfCqHrcNlBm/rTUj/y48+SnStWFy+
         a1CJuZngxUQiKYqrExzrhYDOPvsEcKMjeZ0EKiBVic0EcDvme0utFdIDhieesNO2pCWi
         lZag==
X-Forwarded-Encrypted: i=1; AFNElJ8+JT2idrxkXAQhJg2phBeiLELpIt7BDOo3cN6rCyEBFwQW41RUN7m5YKJciXmNIdwXvGB3wcP5KU4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxryu01rgEEPAndU9Ym9FKhyys8+5bGnGRBjYj/wBcpLetVbsfN
	YQem2iAfSfcG40EEwK9TRfWuNYhsqQU0sqFbfG/q4ypop9N0FPfE4EUnKDM7v0/FHwE=
X-Gm-Gg: AeBDievSrCe50JENPDnWgNFw7kmIjg6nM8mhyL1/YOqT4mBeXuayAfiYbSSEaqoQabY
	vlYzstgE8OPPNsVjcZ6/X+nxx7JyMg9ZAy3XgV5M8HjQ2So3psfIFvdwJKAQ/+LVqYEWsqsHRjC
	DH5UiXWfh8aETYk6icfY+SLUUy+P0ddxlPxI/DwFxf+QA5I/5aSuU42vyGX7tgouLc6jQpAyNAw
	/xCX3F50V+pcbfa4byqoc4IIFdkh8347jN6HRAaBZhcOQtY7/5YRKiXTsmXttRzst8vRmRmQBFJ
	lkMrv/Hq/5FUawNfH+3e8EtvKYMuG37v6TT3so9hYUE5yaJPwqNw/tkWZ0qln0bLv8j3IBlqOkQ
	1xqWzJsOWazEVoI4vdaB+i62OEHS9A5UtHGGTb8LAe1OJ9RIpqe8vUGEAPHJpyg1+kGcuUK0ads
	ysYLrt5olyjJw=
X-Received: by 2002:a17:90b:350f:b0:359:8e5e:43de with SMTP id 98e67ed59e1d1-3614049358emr44701147a91.22.1777279191383;
        Mon, 27 Apr 2026 01:39:51 -0700 (PDT)
Received: from xpc ([2400:8902:e002:def5:7882:53a7:6a48:4d11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab4049bsm276063105ad.77.2026.04.27.01.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:39:51 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	WANG Rui <r@hev.cc>
Subject: [PATCH v2 0/2] efi/libstub: Ensure instruction cache coherency after kernel relocation
Date: Mon, 27 Apr 2026 16:39:28 +0800
Message-ID: <20260427083930.36324-1-r@hev.cc>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since [v1]:
  * Move efi_cache_sync_image() after check_platform_features(), matching arm64.

The EFI stub relocates the kernel image by copying it to a new memory
location using memcpy(). On architectures where the instruction and data
caches are not automatically coherent, the copied instructions may not be
visible to the instruction fetch unit without explicit cache maintenance.

This series adds the missing call to efi_cache_sync_image() in the generic
relocation path, and provides a LoongArch implementation using the ibar
instruction to ensure instruction fetches observe the updated contents.

[v1]: https://lore.kernel.org/loongarch/20260427034451.717817-1-r@hev.cc

WANG Rui (2):
  efi/loongarch: Implement efi_cache_sync_image
  efi/libstub: Synchronize instruction cache after kernel relocation

 drivers/firmware/efi/libstub/loongarch.c | 5 +++++
 drivers/firmware/efi/libstub/relocate.c  | 1 +
 2 files changed, 6 insertions(+)

-- 
2.54.0

