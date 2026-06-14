Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9370C383313
	for <loongarch@lists.linux.dev>; Sun, 14 Jun 2026 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781453719; cv=none; b=X+ZiBFGhnoo0Qgg+v4T8e+jMlTlbUVFiRaXccpP4/qjeRXgXpzjGnrLP75brhS40GuItTTi5hmeF3GL4PlCyYmn52h0M7AndQKH1xySrznUW4ICbGVrqjK0BBua9wW4F1EqX2wlPDf0ZNSMFQJ+F6SXnGCqAMklu3hKgXDrrSpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781453719; c=relaxed/simple;
	bh=ZWpS9a7UI+nRWCLynLkdE/5Fa7aQVE9imBBoeHlqO+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tj/hZo68GOm/Lxg6sAXoS1H+8QibKhiV0A4gzLQs6O4M9Wqf4v7A6pJN7xye1CvAHsNDNIT3PgJYq6ZnXZkUHaXdb+oggBlNYHdi3ITgL4f85Woi2tT+wHt2N7ZQxDaphWtD+Fq4k4T0THg9kUkypaiVpV69kh8TOxup32dAafo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a84QBmhd; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a84QBmhd"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c85a2c012e5so721853a12.1
        for <loongarch@lists.linux.dev>; Sun, 14 Jun 2026 09:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781453718; x=1782058518; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oQi4xZ/RL1raijUtjAv0u6PGUwcFZ8P5P6g7tVewY3I=;
        b=a84QBmhdwgBBWwW7Ct1Mc8/qM9lvkY6jMcj9tCFDKvnOYF9OsEq0xY5xnsQ6HxFw2S
         5pNafdHTmEvIHOmtXODyW1mrzqGu0pB9VO11cm7SEEfuIfHxD96YDVnqGqc+irumvzxE
         xUw5obvzFD/Du3l3x5pjDOaK7Sop892Ft70v8wwS2yx8UCvVmwuN4SlgTRxxEa3SFTCL
         x5RSb1wUtyIJHYCa8MmY5HApqpYHrF6uLjAQ7BCg6HnfmdacYMVTLRz4odpWJOAYlI+B
         kG7sVU4amtMD8cY+5uE9Gyf+NEShwVBMz5oc2S7f/AxdEY870+EeNAiVdp0uBnnNMJ+l
         /1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781453718; x=1782058518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oQi4xZ/RL1raijUtjAv0u6PGUwcFZ8P5P6g7tVewY3I=;
        b=nBDh/PKV6Mk/QSQ5vAY8QOVm9JeuAo6TP8hJiTf8BaYmFpzq2ea/tg/Rcukd5fxYw+
         MV0RaMj3OdNAxS5pb//3xhrfWYNhBO/PiPMb78iToMLsQNXEcnYfnpCwsaJeFKiIMtfR
         Fv9yXitot7L/YkpNIMzN34cHn5qhC86B3L39Dezi9/QHipfJNd2GTDSNAGYonEFAWNTX
         +QvPQAw8/WMezO8/R/Tuu6E/Lgg7OhHW8uR8ifVXx3lWmo19o/3XBOaKGBx3k1w4Prg+
         3mdQn/bM3S/NgGAcopggnsuqfSt3Zo0qK9g8e96gqkUIwwZLuMN5lTc2Q4SQvBZS95EX
         nbZw==
X-Forwarded-Encrypted: i=1; AFNElJ/Wq27GasrdDZMZeY9RcYcYZrXSd7wERpeOijzGik49ggMWE84eZ5/3PJ5FOyXXvAl+ZxpwPV5jkuY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxiC2NRyRUCaUqWaYua0Ez8V4imxFTUH+/JSSHpyUIRZkZBKZQ+
	Q+M4YyB0b8fG7RngGivmzFoBK6o+Qnn7690vAFQB4MuFUSQPPjZQuwYJ
X-Gm-Gg: Acq92OFPY6ybJcBieOv9tzrZimslT1B+iFYr8OJCtMucbwt6qRcg7O+yNAaffBPNIGa
	jWpRyDE5Umon4ncRTjIPf2skU2a0xwSgSwCI+S4wKQEETxGSkV+LxNRujKNwyH4DY2IO6l+gXyD
	Seb+V3fPR2tQ+tB3fO7diAbstBQEg6ynqC+yagwpY/4dEh8lCQ3cMroZWGPiMuMlYhnLUqpBjdm
	NkruMTqjdbYhJrQoK/bghaL+n9REnqkVE2h+S/5PyOyyWCIe/XxUHE99zA05Pc9NoUl9wqPVLRw
	rtkGEFdK70O0BiVDlt5r+iAvCEdhuOOf9RVfJMsUw1ddh+dG8p/SwiVXxYIBpoOfl217ndnTqp1
	4d6Vykft9XW6sFhIw3RCv4Hcb/clqfPd+bt9G2gJvVeQBarxETMk+EFyyi+Jk+Qyo/CmKH4ead8
	hDhYevAtJXuzVI2tIoMw==
X-Received: by 2002:a05:6a20:2443:b0:3b4:87c0:d7f with SMTP id adf61e73a8af0-3b783fc439cmr12622311637.32.1781453717759;
        Sun, 14 Jun 2026 09:15:17 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d1d3sm6505293a12.11.2026.06.14.09.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 09:15:17 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH 0/3] of/fdt, LoongArch, MIPS: fix misleading reservation success message
Date: Mon, 15 Jun 2026 01:15:00 +0900
Message-ID: <20260614161503.2219681-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While reading the elfcorehdr reservation paths I noticed that
fdt_reserve_elfcorehdr(), LoongArch's arch_reserve_vmcore() and MIPS's
mips_reserve_vmcore() ignore the return value of memblock_reserve() and
print a success message even when the reservation fails.

memblock_reserve() is unlikely to fail this early in boot. However,
printing success on a failed reservation is misleading. I think it is
worth fixing, but feel free to drop it if you disagree.

The three call sites are in different trees, so I split the change into
one patch per arch/subsystem. The patches are independent and can be
applied separately.

Sang-Heon Jeon (3):
  of/fdt: fix misleading elfcorehdr reservation success message
  LoongArch: fix misleading elfcorehdr reservation success message
  MIPS: fix misleading elfcorehdr reservation success message

 arch/loongarch/kernel/setup.c | 5 ++++-
 arch/mips/kernel/setup.c      | 7 +++++--
 drivers/of/fdt.c              | 5 ++++-
 3 files changed, 13 insertions(+), 4 deletions(-)

-- 
2.43.0

