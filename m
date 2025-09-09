Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F07C2D29D8
	for <loongarch@lists.linux.dev>; Tue,  9 Sep 2025 09:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757410036; cv=none; b=qJLja9Bf/ge/QnoQMkPjMUXdaX7UsTVdtY0n3plcC9qfShKbZhTwuDYTBABXiVI/8CB5I8R0d5JZxpsAMSaBi7H3xfENAnRYrM5IZwg5xfPlsuDsbvMl8y4UF6t3qt6F9Xa/RudVwj47y6LgmRYe+mtMDHmsTUvjfFHx25IT7AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757410036; c=relaxed/simple;
	bh=+DLg60lZDBzN6GJTarOXafWeiiDD4x1Nkq280BXb/+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t2NiTq00ga+z79+PSHkw5bmcprAVm1eKYq/N+b1WxHnORSo5CVZzsLGr1Y0+qod17bly+LfiKF9ljywpu0ZZoxp1/k6DC18iphE5bU+9btHy+6i0Tvu/+iZe/xeuz4aNy5O7mM6R55bAAMXIUEe0dbFlbN8gGlcc6xz/WO9TVR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxmdHt8r9om08IAA--.17857S3;
	Tue, 09 Sep 2025 17:27:10 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxbMHr8r9oeuSJAA--.56108S2;
	Tue, 09 Sep 2025 17:27:08 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: WANG Rui <wangrui@loongson.cn>,
	rust-for-linux@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Fix objtool warnings with RUST on LoongArch
Date: Tue,  9 Sep 2025 17:27:05 +0800
Message-ID: <20250909092707.3127-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxbMHr8r9oeuSJAA--.56108S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUwmhFDUUUU

This series is to fix objtool warnings when compiling with LLVM and
CONFIG_RUST is set, thanks WANG Rui and Miguel for your suggestions
about RUST.

The second patch uses the option -Zno-jump-tables, here is a related
discussion:

https://github.com/rust-lang/rust/pull/145974#issuecomment-3236418282

Tiezhu Yang (2):
  LoongArch: Make LTO case independent in Makefile
  LoongArch: Handle jump tables option for RUST

 arch/loongarch/Kconfig  |  4 ++++
 arch/loongarch/Makefile | 16 +++++++++++-----
 2 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.42.0

