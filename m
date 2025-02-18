Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC25026F44F
	for <loongarch@lists.linux.dev>; Tue, 18 Feb 2025 17:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739901479; cv=none; b=QU56GmEVvj242x5GvL6T+79Ql+RqWyQFyTrX4wJiTnaGncw2EAXNdju9n1efUmnbbxBK9qtkULpzOVAoyYumguUbNTvYcpWnN73Y8MjiKB2KWGpr7DIyyd2AXxuEgRrA3nxfpbr6DGvCf03OPFE7SZo40xbEJtIfj7OKbYZbQCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739901479; c=relaxed/simple;
	bh=SKnjvoPaAHGikEYH0U8N6QZO8ST6XHXeB5oJXKQXdvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VmN4e+NndxSu9BpImmn7hoOw5kNcFN92OZk0R0CsWu0+wdb4YiadbbzamiuWZN6Z6MI/1OxB6iaI2+zDSc/wbSuORUt2wMfz8AAoPEyf+mzR4NLtr2cIGforOvL7TqusfpDcGc2jfJGx/JxuytUPGoNLvReykX2nSyL3FDERpTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1hRvkdi; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1hRvkdi"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54622e97753so39362e87.0
        for <loongarch@lists.linux.dev>; Tue, 18 Feb 2025 09:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739901476; x=1740506276; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oFRKePU7thBon8tfL6vskAhYenxo2fl21vHaxPHsJUc=;
        b=l1hRvkdiqx/N2IzdMeoyTpx1/rOnkeMFTQwMMe/ZqaKCmwjkuKQVd7JNb/sE+OuDwM
         e9UNYStk/WC7z9xqPG21ErsDHBU/RJR7nkMwZTZX8Y4/1RcMY84UZJOYxvPhQNEk9T6x
         bxgP1VvFozkrc7UVQ8I/8SO2/1ftMmsW7mVnJIMXQw8rjYWZA5Xo7VckMJGlX6iNBu0N
         /41QWgQA2ixVDG68j77UhUR9PlPF1bzwCPHsVjxQ55dje6hRrgj4odkPRZtfBhufmOR/
         WbnY4FSjworlhD9DaoEhaP2OoYtYgkFiLIh9GKDeGkWKWC66e3PwV+2AGOP1PHdf5xom
         BzfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739901476; x=1740506276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFRKePU7thBon8tfL6vskAhYenxo2fl21vHaxPHsJUc=;
        b=gSiemMAAGfPCL4W1dnIEzfbJuzITiez/d2H2Z4YHcPtyNI88wFKgD0BPVutRT0NygN
         BxDvNY5qrlHIjy1I7A9XfWNHr1wtLjv1K/ElDmDSsA83g8gdf2o3RsXWEDY/51IgzgDO
         jrnzmVgarmHLeEUwJ1wyq+lWH3U6xOuvLdfvcAt5OK04tlmI78NL3qz+V6JMkxX2wShY
         K+DnrrSMykc4QUMdt5i91EiMfWDxaYBc5r1zwRKALADwz/MIqsB4NZ1OGMFjt5jzq0KE
         2OeIDMkylLioKeZ9AB1Z6P7i7vKxs98d1Np55cJ+i2Pv7FWCx1VeE6ilFCUvHL6kJGrf
         icxw==
X-Forwarded-Encrypted: i=1; AJvYcCXJI2fiwn7Da6oTMKQIGOJ3KIiaFc8B9znjJcCP/CPFnNgsCiJ/joqaEfAgDFuQDo1D+VFy+F9qbsI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPXWYbkuUqOh2Y+x2OxOr5uf/fN7oA8swa//Kr7BRuKsqzS085
	Wd3zG5PxJSIiZjAAbxYhLwKPeDtdri5evsnGfnZoE5I1yLLakNiG
X-Gm-Gg: ASbGncs7CnbPSiPm+SBE30U6FROxryWzZcFwcyRbG35PD/dpgh27ABvjTqegdCmCMfW
	0CFpwQAR4Yyy4aL1k8WyhjCEo9y4H5VU1gZjT58uzhiZpQeUuyINX8MLQYlikUeSBMyfOkXrdRK
	GyHLCOmpLM5lK3tubmvXPbQ4vlmVOo7AlTZom4XqfAuJ7nAoTELKBQGEVSMk5cs/BOC4vUf0A4Z
	ruY6s98mn2Wq1dAsJg//aRlM8mdad4yS46pWNBiPtzeEBVqB7SbiFMGPMj24T0jUuC8DxJiQWMt
	Ffm5YIzNm48hLt2QGXPvI+V31fDRAzTuwhfxmtlyzXNBB6QkagdWvT/mchAfrQ==
X-Google-Smtp-Source: AGHT+IGfFBi/u9SniGtV33nIqkglJaUtkaaAX/KBzbUXSrhxIdAk38ItpiS7x3PdO+hl8rMx2A+8sQ==
X-Received: by 2002:a05:6512:3b23:b0:545:550:83e6 with SMTP id 2adb3069b0e04-5462eaa1f1amr241343e87.5.1739901475583;
        Tue, 18 Feb 2025 09:57:55 -0800 (PST)
Received: from es40.darklands.se (h-94-254-104-176.A469.priv.bahnhof.se. [94.254.104.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545254f7072sm1709286e87.127.2025.02.18.09.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:57:54 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: linmag7@gmail.com,
	richard.henderson@linaro.org,
	mattst88@gmail.com,
	glaubitz@physik.fu-berlin.de,
	ink@unseen.parts,
	kees@kernel.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org
Cc: chris@zankel.net,
	dinguyen@kernel.org,
	jcmvbkbc@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	loongarch@lists.linux.dev,
	monstr@monstr.eu,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 0/1] mm: pgtable: fix pte_swp_exclusive
Date: Tue, 18 Feb 2025 18:55:13 +0100
Message-ID: <20250218175735.19882-1-linmag7@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first version of this patch intended to fix issues with swap memory on
alpha, when swapoff fails to writeback exclusive swap pages and gets stuck
in an infinite loop trying to do so. This problem appeared after commit
a172d5128706028ac07b8db709728379ecc72f6e and as far as I know only
affected the alpha architecure.

Changes in v2:
As suggested by Al Viro, rather than doing a bit-shift alpha-only fix this
version of the patch makes pte_swp_exclusive return bool instead of int.
As Al pointed out, this will also better reflect how pte_swp_exclusive
is actually used in the code.

Best regards
Magnus Lindholm linmag7@gmail.com

 arch/alpha/include/asm/pgtable.h             | 2 +-
 arch/arc/include/asm/pgtable-bits-arcv2.h    | 2 +-
 arch/arm/include/asm/pgtable.h               | 2 +-
 arch/arm64/include/asm/pgtable.h             | 2 +-
 arch/csky/include/asm/pgtable.h              | 2 +-
 arch/hexagon/include/asm/pgtable.h           | 2 +-
 arch/loongarch/include/asm/pgtable.h         | 2 +-
 arch/m68k/include/asm/mcf_pgtable.h          | 2 +-
 arch/m68k/include/asm/motorola_pgtable.h     | 2 +-
 arch/m68k/include/asm/sun3_pgtable.h         | 2 +-
 arch/microblaze/include/asm/pgtable.h        | 2 +-
 arch/mips/include/asm/pgtable.h              | 4 ++--
 arch/nios2/include/asm/pgtable.h             | 2 +-
 arch/openrisc/include/asm/pgtable.h          | 2 +-
 arch/parisc/include/asm/pgtable.h            | 2 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h | 2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 2 +-
 arch/powerpc/include/asm/nohash/pgtable.h    | 2 +-
 arch/riscv/include/asm/pgtable.h             | 2 +-
 arch/s390/include/asm/pgtable.h              | 2 +-
 arch/sh/include/asm/pgtable_32.h             | 2 +-
 arch/sparc/include/asm/pgtable_32.h          | 2 +-
 arch/sparc/include/asm/pgtable_64.h          | 2 +-
 arch/um/include/asm/pgtable.h                | 2 +-
 arch/x86/include/asm/pgtable.h               | 2 +-
 arch/xtensa/include/asm/pgtable.h            | 2 +-
 26 files changed, 27 insertions(+), 27 deletions(-)
