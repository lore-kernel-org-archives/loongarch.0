Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8B1361DBA
	for <loongarch@lists.linux.dev>; Mon, 27 Apr 2026 03:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777261523; cv=none; b=G5DGKk2l3VZe3wU+e2Dh2RK20UW5tooVDBuy2VmPX3cycLq66NaZBWfMI9ODUu4Hs7N6QJuJpeV6Pt0qJ9jXSlRI2R5oDMjebXchVFrVJANOlYAUTaAtTTuTcIPEwrZ9PyqwRPr+ndHeSUJK3WSJ4asNrlY4lbVBZiTIx+Hp/jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777261523; c=relaxed/simple;
	bh=Z8T81jPhfrem9chwe22i+fePhVQlA7ofKkkJOecRdnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uy8u2CUxkkGV9k9xhg8N6NW2+DbdfpaQuBFBSq/tOmf3Hl6GM+mJrdd65HeHrtysTesDqt9IatFJ9mIxzt4x8Vy8M6PPv4C9iQj8bQpQxU32YCKsmkOjxMFKFGeDNPsd3Ug892uCYH2u+qIKQeYXg7EY68l6eYh58kxe9i9m36s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=FQBVqu3+; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="FQBVqu3+"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b45cb89f7eso60329325ad.0
        for <loongarch@lists.linux.dev>; Sun, 26 Apr 2026 20:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777261522; x=1777866322; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=olS8oKBz9uJQUERWBS12mc4yNCSnT/djHgFK88Ulfns=;
        b=FQBVqu3+fp1KgnE12nih4/3pwgqRGP92q/ME0yfGsiiYTC4DFVgK0iNPOoQmMAI2TK
         CU4Y/l78v4BVlCyj1gsl+0S5d3CoRR35hk3MY94BTPiFjnZo7nZJnBlgqr0C5NCZGU0g
         7Rmj/ph+eT2SixHE3Xl2hEOGdRr0cqc8lKeIR2lAdh52HdNRpm9qmzF75jFJvrfsToDo
         eAThz/l4tR8pLa5DTQp72g2Yl09CUkrghg3gXk+268YuCEqKerLENMUA2hvnvEAvHxBg
         vbxOOz1Jm72yGVa6zBtwxu6gye0OXZjKpAc8RPXKsWSVXNUeHPFSxFQ7of/a42ZFtgCi
         h5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777261522; x=1777866322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=olS8oKBz9uJQUERWBS12mc4yNCSnT/djHgFK88Ulfns=;
        b=kTYx09nIJ7l0FFLvaB65G+wDUmhydf6pxQq+1ni8iyLDe7jGS4bnx7BLrYiPKE8uNS
         TnSPzDMvV7j2mfeFnOCg8BsETJG9bNzUUAIJUkwStNV2fRMLk/s1r8pmJVuYcl1PttUh
         nlqcelXEQmpgAAfXcgPgURZ0IiMS83xFHqZYKiYtRQyYA36+U2fAe4lvDrWtmAgdn1r2
         aIcbeDirdtlYkgwJPfYbZzxo9MpzcAA6liZ/VPDqlII3EiAL54YA+03ubdDasOZLrCwl
         HJj2FyiJM0LFS3iKNKeXCAVpFtjd6xKqGNDeGrnSPBLwqIPM9iE8HpyxLxUZA2mJuorW
         +eOA==
X-Forwarded-Encrypted: i=1; AFNElJ84cx0Ww/+BTZe6sEiNkxw7883TlqptuXR3/rLNK7ZNGzSTGO14vxhWcRM/PS4ROklafzbJ7spBxgQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxZ5Nu8/sgNcBGexKvjb2DEaUrbOqzRsDt5mmIuhjrXVnBbB09N
	TkLpBkRWZbOvhZadMepnCbdOzJ1Isq3t+JwUQxphAzM7yKawNRF3wqXId5bV7v8gP5g=
X-Gm-Gg: AeBDievazGXiW3V/u1my5YxNRWGEKvZwt+WJ4Fgkco2IrHPNCoou3zPW0/g9AnU5mqG
	OwUVYTijCk0w8uNrtvAFLEPZLMpEx+SKs3OmH7lKUPaEbhAEIHGOqCXO4gfdYHsf8Wf7kC1GEqg
	VFhj1fCz79BfYp1v8kPAyIthTf7X1U4vjF2PTFZ+8wjvht/HBKkoWJOWgEx9frNl+F28+O61Z+T
	NPAgT3t6T+zvYM/pCVdG62S0dTQok6esn/GqFtKQu/+z5tmJ43h0nMSydhzRcrF5tu6bMy18UQ9
	+Uu27gXfGAuIc3R6dYzhJhmL9DxY0YjoKcXsUUQvGos7IMaDLh0WeHgSiS1iRDfaqYAY664D0Fg
	8mFn36909nlSk5b1OlHLWUZbfyYghlHjY+Lysqr6LWO2RyZm+glzOaZqQ8Egazr9JUj59/5rENi
	qLC1w2v8p+x143BQ1h12s=
X-Received: by 2002:a17:903:124a:b0:2b2:5515:661c with SMTP id d9443c01a7336-2b5f9f61603mr431091235ad.31.1777261521666;
        Sun, 26 Apr 2026 20:45:21 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de3c:3085:4d80:3614:2212])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5faa3073asm279061375ad.27.2026.04.26.20.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 20:45:21 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Ard Biesheuvel <ardb@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	WANG Xuerui <kernel@xen0n.name>,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	WANG Rui <r@hev.cc>
Subject: [PATCH 0/2] efi/libstub: Ensure instruction cache coherency after kernel relocation
Date: Mon, 27 Apr 2026 11:44:49 +0800
Message-ID: <20260427034451.717817-1-r@hev.cc>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The EFI stub relocates the kernel image by copying it to a new memory
location using memcpy(). On architectures where the instruction and data
caches are not automatically coherent, the copied instructions may not be
visible to the instruction fetch unit without explicit cache maintenance.

This series adds the missing call to efi_cache_sync_image() in the generic
relocation path, and provides a LoongArch implementation using the ibar
instruction to ensure instruction fetches observe the updated contents.

WANG Rui (2):
  efi/loongarch: Implement efi_cache_sync_image
  efi/libstub: Synchronize instruction cache after kernel relocation

 drivers/firmware/efi/libstub/loongarch.c | 5 +++++
 drivers/firmware/efi/libstub/relocate.c  | 1 +
 2 files changed, 6 insertions(+)

-- 
2.54.0

