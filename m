Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275BE2F2605;
	Tue, 23 Dec 2025 08:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766477103; cv=none; b=Getg/s/CezK7sJN4BlSnJ0h0RANSiJTnaiwqwdEA84ttjMALovmSouO4E/brN03K82EjuoyDGvsiDlujv6LUNsxiE+Ke+eet0x7msMAdlj/X3E9Bl5wI4w9ROH7Udez4v/lDcWP1ykBn28cb+GpQf4JdHuMuAtpWsp5nB+V+oWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766477103; c=relaxed/simple;
	bh=sAfJqKmYU3IZfPQ0kgZrcNYDITv9ZRNxXRfIsuPyeoQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tI4rbN37TF1W0jxvzTp9RvfISoikiEXcQug+qTsaAnnCvd/HL/A94Hvmmzu9fNowzt53BGmV+tm+2gemWV6zL5fUoFX+WOVJ1Zku1/1PB0PtXRUhqMjwDAC4WXvmBuybfL02yPm7HmMplzN7gmQFp1URkzhAaFrNGe8DPelk5uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9DEC113D0;
	Tue, 23 Dec 2025 08:05:00 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 0/7] irqchip: Adjust LoongArch irqchip drivers for 32BIT/64BIT
Date: Tue, 23 Dec 2025 16:04:30 +0800
Message-ID: <20251223080437.3367240-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Linux-6.19 adds basic LoongArch32 support:
https://git.kernel.org/torvalds/c/9551a26f17d9445eed497bd7c639d48dfc3c0af4

On the basis, this series adjust the LoongArch-specific irqchip drivers
for both 32BIT and 64BIT.

Jiaxun Yang & Huacai Chen (7):
 irqchip/loongarch-avec: Adjust irqchip driver for 32BIT/64BIT.
 irqchip/loongson-liointc: Adjust irqchip driver for 32BIT/64BIT.
 irqchip/loongson-eiointc: Adjust irqchip driver for 32BIT/64BIT.
 irqchip/loongson-htvec: Adjust irqchip driver for 32BIT/64BIT.
 irqchip/loongson-pch-msi: Adjust irqchip driver for 32BIT/64BIT.
 irqchip/loongson-pch-pic: Adjust irqchip driver for 32BIT/64BIT.
 irqchip: Allow LoongArch irqchip drivers on both 32BIT/64BIT.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 drivers/irqchip/Kconfig                | 11 +++++------
 drivers/irqchip/irq-loongarch-avec.c   | 14 +++++++------
 drivers/irqchip/irq-loongson-eiointc.c | 36 ++++++++++++++++++++++++++++------
 drivers/irqchip/irq-loongson-htvec.c   |  6 +++---
 drivers/irqchip/irq-loongson-liointc.c |  5 +++--
 drivers/irqchip/irq-loongson-pch-msi.c |  7 ++++---
 drivers/irqchip/irq-loongson-pch-pic.c |  7 ++++---
 7 files changed, 57 insertions(+), 29 deletions(-)
---
2.27.0

