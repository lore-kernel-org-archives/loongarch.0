Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B70634107E;
	Mon, 12 Jan 2026 08:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768207418; cv=none; b=nIlNkQI3tkYD5hTj6scnrEvIBa19yVXJ9KrEsbLydpw0pcDWZd5CiPW5iIUFcLn7e2zZ9SVbsDsr7zh24EOooe3YaNqihGLt4sN2G1+Veth2Mi2jrF+RJSXpIy5dwDsoM4wcJEN3h9r/GNwcXiOr6Z2Vz63+L4l+RUMfgRdteb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768207418; c=relaxed/simple;
	bh=w3j6qL/U3kEXRhLhAXrwyVT6Qb4/zvMyjE3xxNaCinE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Piw20ZRR+4CVb77PRLtt7npl9EB+kZS241rQoGSEdbennrtGfJLi23SGMf6sG4jvqkLT3SYwclPCHVYqCKvqevXR1OwIk+iNF0BUpTSk5XMbNFU6bAi+D5gt4uzFZ+W8SKszoQm95KneTxgipFFUUKCpTWpDYG53VQPGKc7dW2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04617C116D0;
	Mon, 12 Jan 2026 08:43:35 +0000 (UTC)
From: Huacai Chen <chenhuacai@loongson.cn>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xuefeng Li <lixuefeng@loongson.cn>,
	Huacai Chen <chenhuacai@gmail.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH V2 0/7] irqchip: Adjust LoongArch irqchip drivers for 32BIT/64BIT
Date: Mon, 12 Jan 2026 16:43:13 +0800
Message-ID: <20260112084320.1982244-1-chenhuacai@loongson.cn>
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

V1 -> V2:
1. Use if IS_ENABLED() instead of ifdeffery.
2. Add Co-developed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>.

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

