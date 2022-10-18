Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26C846A7
	for <loongarch@lists.linux.dev>; Tue, 18 Oct 2022 10:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
	t=1666087509; bh=Q9JRMiLSIMtTXkcD2C6g1u0Wo1VgF16RxUcyjz3rqJo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gkBII52TSg1W1zd/TJErH6O8y3SZoqDfqyiSjPo4LS763M/7GiRqXvH2uCwqCQBZN
	 70TJq5bS5lIe7zXz3z+6BKDoeJvZLOO28p/ybc/auIfQkxI07Cq8SnWv/Kzb9WplxN
	 UqzRum5QBw70BT8Yh6R63smJUToGbyQomG3WzYhg=
Received: from ld50.lan (unknown [101.88.135.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 7A0E8606AA;
	Tue, 18 Oct 2022 18:05:09 +0800 (CST)
From: WANG Xuerui <kernel@xen0n.name>
To: linux-doc@vger.kernel.org
Cc: WANG Xuerui <git@xen0n.name>,
	Huacai Chen <chenhuacai@kernel.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	loongarch@lists.linux.dev
Subject: [PATCH 1/2] Documentation: LoongArch: Document the syscall ABI
Date: Tue, 18 Oct 2022 18:04:56 +0800
Message-Id: <20221018100457.3440691-2-kernel@xen0n.name>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018100457.3440691-1-kernel@xen0n.name>
References: <20221018100457.3440691-1-kernel@xen0n.name>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: WANG Xuerui <git@xen0n.name>

Signed-off-by: WANG Xuerui <git@xen0n.name>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Alex Shi <alexs@kernel.org>
Cc: Yanteng Si <siyanteng@loongson.cn>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: loongarch@lists.linux.dev
---
 Documentation/loongarch/index.rst       |  1 +
 Documentation/loongarch/syscall-abi.rst | 36 +++++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 Documentation/loongarch/syscall-abi.rst

diff --git a/Documentation/loongarch/index.rst b/Documentation/loongarch/index.rst
index aaba648db907..5dacd7143d2f 100644
--- a/Documentation/loongarch/index.rst
+++ b/Documentation/loongarch/index.rst
@@ -10,6 +10,7 @@ LoongArch Architecture
 
    introduction
    irq-chip-model
+   syscall-abi
 
    features
 
diff --git a/Documentation/loongarch/syscall-abi.rst b/Documentation/loongarch/syscall-abi.rst
new file mode 100644
index 000000000000..6f63aa3cfc64
--- /dev/null
+++ b/Documentation/loongarch/syscall-abi.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+===============================
+Linux/LoongArch system call ABI
+===============================
+
+This document describes the system call ABI of Linux/LoongArch.
+As the kernel is 64-bit only for now, the description below assumes an LP64\*
+calling convention.
+
+Syscall numbers and parameters
+==============================
+
+Like with other recent architecture ports, for the most part Linux/LoongArch
+reuses the asm-generic syscall numbers and parameters.
+There are a few points worth mentioning though.
+
+* There is no ``renameat``. Use ``renameat2`` instead.
+* There is no ``getrlimit`` or ``setrlimit``. Use ``prlimit64`` instead.
+* There is no ``fstat`` or ``newfstatat``. Only ``statx`` is provided, and
+  low-level components making their own syscalls are expected to be aware of
+  this (and provide their own shims if necessary).
+
+Invocation
+==========
+
+System calls are currently made with the ``syscall 0`` instruction.
+Although the immediate field in the instruction is not checked at present,
+it is strongly advised to keep it zeroed in case it is to be made meaningful
+in the future.
+
+The system call number is placed in the register ``a7``.
+Parameters, if present, are placed from ``a0`` through ``a6`` as needed,
+as if calling a function with the respective arguments.
+Upon return, ``a0`` contains the return value, and ``t0-t8`` should be
+considered clobbered; all other registers are preserved.
-- 
2.38.0

