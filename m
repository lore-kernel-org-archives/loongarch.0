Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125407B
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 10:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1666087511; bh=Up/gpEK4jgyKjT0O2XzoNUcjCAExMeiAMzY1xht4nzk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LwYs1+5cqW3kci3hMleC8fSLqfF9LypmNG1y7bwduD5po3YRTCRRAGPGOh61Pqzdf
	 o+dixOWMBZ7ZN2r5B8FjeyOMygV3UO0o9HVo4aOgsnbct4U7oPZgGHu1YJcJbrk+ZB
	 qLCAjEhVusLknoPR7o0OfGJ0QgKnMip8+zBvEp9U=
Received: from ld50.lan (unknown [101.88.135.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id AF7D6606AB;
	Tue, 18 Oct 2022 18:05:11 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: linux-doc@vger.kernel.org
Cc: WANG Xuerui <git@xen0n.name>,
	Huacai Chen <chenhuacai@kernel.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	loongarch@lists.linux.dev
Subject: [PATCH 2/2] docs/zh_CN: LoongArch: Translate the syscall ABI doc
Date: Tue, 18 Oct 2022 18:04:57 +0800
Message-Id: <20221018100457.3440691-3-kernel@xen0n.name>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018100457.3440691-1-kernel@xen0n.name>
References: <20221018100457.3440691-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Alex Shi <alexs@kernel.org>
Cc: Yanteng Si <siyanteng@loongson.cn>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: loongarch@lists.linux.dev
---
 .../translations/zh_CN/loongarch/index.rst    |  1 +
 .../zh_CN/loongarch/syscall-abi.rst           | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/loongarch/syscall-abi.rst

diff --git a/Documentation/translations/zh_CN/loongarch/index.rst b/Documentation/translations/zh_CN/loongarch/index.rst
index 7d23eb78379d..6edcc382492f 100644
--- a/Documentation/translations/zh_CN/loongarch/index.rst
+++ b/Documentation/translations/zh_CN/loongarch/index.rst
@@ -15,6 +15,7 @@ LoongArch体系结构
 
    introduction
    irq-chip-model
+   syscall-abi
 
    features
 
diff --git a/Documentation/translations/zh_CN/loongarch/syscall-abi.rst b/Documentation/translations/zh_CN/loongarch/syscall-abi.rst
new file mode 100644
index 000000000000..9089c9f6e9c1
--- /dev/null
+++ b/Documentation/translations/zh_CN/loongarch/syscall-abi.rst
@@ -0,0 +1,37 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/loongarch/syscall-abi.rst
+:Translator: WANG Xuerui <kernel@xen0n.name>
+
+============================
+Linux/LoongArch 系统调用 ABI
+============================
+
+本文档描述了 Linux/LoongArch 的系统调用 ABI。
+由于当前内核仅有 64 位版本，以下的描述均视为遵循 LP64\* 的过程调用约定。
+
+系统调用号与参数
+================
+
+正如其他新近的架构移植，绝大部分 Linux/LoongArch 系统调用号和参数都复用
+asm-generic 的定义。
+倒是有些值得一提的点。
+
+* 没有 ``renameat`` ，请使用 ``renameat2`` 。
+* 没有 ``getrlimit`` 或者 ``setrlimit`` ，请使用 ``prlimit64`` 。
+* 没有 ``fstat`` 或者 ``newfstatat`` ，只有 ``statx`` 。
+  自己进行系统调用的底层组件应当感知这一事实，如有必要，应自带兼容逻辑。
+
+调用方式
+========
+
+目前都通过 ``syscall 0`` 指令进行系统调用。
+尽管当下内核并不检查指令字中的立即数域，我们仍然强烈建议保持其为零，
+这是为了防止未来它被赋予其他语义而造成您的程序产生非预期结果。
+
+系统调用号应被存放于寄存器 ``a7`` 。
+如系统调用有参数，这些参数应如函数调用一般，从 ``a0`` 到 ``a6`` 按顺序存放。
+系统调用返回时， ``a0`` 存放返回值， ``t0-t8`` 则应被视作被破坏（clobbered）；
+其他寄存器的值都保持不变。
-- 
2.38.0

