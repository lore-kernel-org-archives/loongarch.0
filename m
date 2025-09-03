Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EECE2F28E0
	for <loongarch@lists.linux.dev>; Wed,  3 Sep 2025 09:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756893216; cv=none; b=Hy+l1zYFfRKgL+/s37JOdCIYSxlAOafD2dXzEvoUh2Ya6GnXJDgD//4hwPAXHWyN3N7s3CV1enBBPFEsIhAX/2pZ6j0gAZY499ij2M4r3Z1IiUZyJX0IslAUS0/0HUGafkNQebzdiGqLod0J0RLohMlyf6u8FAhSAi8KGKMMN8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756893216; c=relaxed/simple;
	bh=9pnQtopGV2abpjWDxF1mFfUr6ACXC/Esur84mjvfVmU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BD4waYdiCRtJVnGV3QE4Ai7wjSCz9pA6WFhVEftQayghzaT8PpczK5cjQ6Xuo1F5iIehkx2bpJDfsiNDp4Tr7hJf+4CeYibXkcecAb8fFAxybeXkUizD0v8r5zwbXyidvhDoSPoiUt2Ul+JKXH+ihbikCoNZD/W3mZa0qA5Wmrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx3tITELho6i0GAA--.12921S3;
	Wed, 03 Sep 2025 17:53:23 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxfcEMELhom_16AA--.5842S3;
	Wed, 03 Sep 2025 17:53:20 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: WANG Rui <wangrui@loongson.cn>,
	rust-for-linux@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/3] docs: rust: quick-start: Add another way to install
Date: Wed,  3 Sep 2025 17:53:13 +0800
Message-ID: <20250903095315.15057-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250903095315.15057-1-yangtiezhu@loongson.cn>
References: <20250903095315.15057-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxfcEMELhom_16AA--.5842S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7AryrKr4fCF1fGFWDJr4UZFc_yoW8Ar43pw
	4jkr9xA3sxGr12kryrtayfWrW5CrWSgrWUGFZ7K347CrZ8Arn5trnrt3yYvF1DuFW8AF4Y
	vF1vyry5ua95A3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkjb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07UNvtZUUUUU=

When compiling with LLVM and CONFIG_RUST is set, there is build error on
LoongArch:

     --> rust/kernel/lib.rs:331:13
      |
  331 |         loc.file_with_nul()
      |             ^^^^^^^^^^^^^ method not found in `&'a Location<'a>`

  error: aborting due to 1 previous error

It seems that the latest version of rustc is not compatible, in order to
install the workable rustc version for LoongArch, there is another simple
and easy way, add it to the Quick Start guide.

Suggested-by: WANG Rui <wangrui@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 Documentation/rust/quick-start.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 155f7107329a..fdd9f54f4fe4 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -21,6 +21,20 @@ Alternatively, the next two "Requirements" sections explain each component and
 how to install them through ``rustup``, the standalone installers from Rust
 and/or building them.
 
+Additionally, if you want to install a specified version, you can remove the
+exist packages from your Linux distribution first, e.g. for Fedora Linux::
+
+	dnf remove rust
+
+and run the following in your terminal::
+
+	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
+
+then follow the onscreen instructions to install from the official release
+channels, enabling you to easily switch between stable, beta, and nightly
+compilers and keep them updated. Please see https://rustup.rs/ for more
+information.
+
 The rest of the document explains other aspects on how to get started.
 
 
-- 
2.42.0

