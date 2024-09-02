Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93069558BC
	for <loongarch@lists.linux.dev>; Mon,  2 Sep 2024 05:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725255110; cv=none; b=ZdnQpqEMHM9XYtP2uanNBMXsXoJu2lBOqHc0Zce+IsEFBdUlf1R+OIj9NzaDzmLL3Bn64OzoneeTorPGlFCveftyNzYpYi0B9JnOg8qrBJieFPIRcpyV8TutYbentu4quM9XqgSxEsSUx6VjuoM92E6WZhRcZTzbvPrev8Haa28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725255110; c=relaxed/simple;
	bh=p7pV+OekQRanLYGDkHAzPVIoQUeenJaMBzGXbvR4lNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BNQGIM2UfQO7JrnSueS6G9vnghQ3UXeWJkuGPw5tCcvMIxiAvYMakIe1GFxEu+R+p19BfyN3TuOGBdyxRA+8sJditNu+ACR0Z7HehB4uPBLCkuCLm0wFxsVO0ZlXzHGTUf6MzCpZ5RJWIWPDwaYpPmw3tuwJYOHQcbmMx3qOmZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=NUJhKsKQ; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="NUJhKsKQ"
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-70f6e68a1c1so92762a34.0
        for <loongarch@lists.linux.dev>; Sun, 01 Sep 2024 22:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1725255107; x=1725859907; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dcARxruAP0vzhVrIv4mZE+MUS7Q/ymIzQKM3BTvM2Fg=;
        b=NUJhKsKQvUbB2/Tu8RYjp28qEmlxqAtvFG7A5N9D5STl9dSYw2SouRaHp7pk0ntkPe
         nOmJ7ZsKriEEAi9U9Mg5TjjFQ01alkpP2wuO7C5x1NsupvjIZDDJb6olw9WIJFnLnspn
         189DZT2Eu8mZIQJrBLzkjR8vEseYjkXUYZVv7NFGBTVN2T928Fe8zdwbm4xwPb8hESll
         YxsOTKYXi66POYfVwyhdo5qNeZMB4tx7CwpZupfSuJSOARbX3C5/b63jAcZnuckZ9c4F
         7Ghsw3i1Q989He62ZiN7Q0y6mYjsntNega7t+LOaxT+sZ8vMofnMFl3hUTeq6HF3iwgj
         08MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725255107; x=1725859907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dcARxruAP0vzhVrIv4mZE+MUS7Q/ymIzQKM3BTvM2Fg=;
        b=NG/o5hPhSvQXhVCR97iPA2w0oJVU34u0bTV4nXNmju+Q8fYhS/gWeEW8X2BFyacjKX
         eoe8lFaSLD6R3lSTwiC1VdHIuBkTqYkNMHIqxOmc0pYll1rgV1GkoBzJmbqHvwrAI4vh
         FQotAMV+pm4bscuxXWzvOAHAYU555ci8LMijKgiZ+QtL2ooFiRoOgsy4n6+a19oyfQth
         faWBRrXDBC6FaSglO1unydFqqWv0M1Byjg8eZHCD9KZ6p2j/2rl5UBJ/c3+C5rtf1T46
         PU2c9Q4JmXFi/7sRFpufOmwZ+IptJ+1HaU2XQDaFJfNhiPIE5B+BqfcsiDlR+7gAelxs
         dIeg==
X-Forwarded-Encrypted: i=1; AJvYcCVpypaKAmetmaY66NGzNytP3VvZBZCNtVM/hIJiStbzxeGakOP8kfvbBwLdBLhW1VPo+AOVo70yBME=@lists.linux.dev
X-Gm-Message-State: AOJu0YxoKvYIgB6yiUhV63GlHNJ2OMJ5MS9qsoxESyeUPrt6biSGAWUn
	Hg6xRyDRxYk2XsiNBBq36pTiqeB28qfGSnTbtWnl/qrsMp5LFdDfNczbttlf/Kg=
X-Google-Smtp-Source: AGHT+IG4O9VSEnbCHyMlef62PC66eJmk+Wcfg7k+VoUwjggysZcp2Zp81AWYRWJzYn+qz65dfh/WPA==
X-Received: by 2002:a05:6871:b09:b0:26c:78ce:b0cc with SMTP id 586e51a60fabf-277b0dd215bmr5158894fac.8.1725255107434;
        Sun, 01 Sep 2024 22:31:47 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::901f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e55a692fsm6076279b3a.60.2024.09.01.22.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 22:31:46 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-um@lists.infradead.org,
	kernel-team@fb.com
Subject: [PATCH 0/2] mm: make copy_to_kernel_nofault() not fault on user addresses
Date: Sun,  1 Sep 2024 22:31:27 -0700
Message-ID: <cover.1725223574.git.osandov@fb.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Omar Sandoval <osandov@fb.com>

Hi,

I hit a case where copy_to_kernel_nofault() will fault (lol): if the
destination address is in userspace and x86 Supervisor Mode Access
Prevention is enabled. Patch 2 has the details and the fix. Patch 1
renames a helper function so that its use in patch 2 makes more sense.
If the rename is too intrusive, I can drop it.

Thanks,
Omar

Omar Sandoval (2):
  mm: rename copy_from_kernel_nofault_allowed() to
    copy_kernel_nofault_allowed()
  mm: make copy_to_kernel_nofault() not fault on user addresses

 arch/arm/mm/fault.c         |  2 +-
 arch/loongarch/mm/maccess.c |  2 +-
 arch/mips/mm/maccess.c      |  2 +-
 arch/parisc/lib/memcpy.c    |  2 +-
 arch/powerpc/mm/maccess.c   |  2 +-
 arch/um/kernel/maccess.c    |  2 +-
 arch/x86/mm/maccess.c       |  4 ++--
 include/linux/uaccess.h     |  2 +-
 mm/maccess.c                | 10 ++++++----
 9 files changed, 15 insertions(+), 13 deletions(-)

-- 
2.46.0

