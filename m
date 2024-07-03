Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B83F17F51D
	for <loongarch@lists.linux.dev>; Wed,  3 Jul 2024 11:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720004756; cv=none; b=Jp4VirWtgLXV4bc7iHkQcc1k2NwExoIB+ugIbWe9XyrWUNpZXoNO/MUBiaW7XNCJW3vqZIv0avsHC31ejp2z1sjez9NCvsYrx8BE2gd2mPIiyUWSdaQMxX2sB0v8BupIELOWuEBQm5PiyllLYkf/NcVuisYVS2hq5nhTVLNKDBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720004756; c=relaxed/simple;
	bh=Nt6ZuaCko+BArRXXU7JkXLT2e8uK2t+eKVQDm+MzM0c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZcfOGvHpa8ScbG/mMmHKUvdp0wS8w4mf6e4GQNlrnG3P3uNoFjDYbn3lwbb5EJIF3oB1mH6u6A9Ya9piSj4ClTw0Fn4GA8o1i/7iZNc+rqYsd3JP5EicAI59VppzCjzo5aDAXrdWqqNOAjCaky/qAgMStRwUBy+/AKdbaWBTg3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.22.233.190])
	by gateway (Coremail) with SMTP id _____8BxXeuOMIVmZ38AAA--.1540S3;
	Wed, 03 Jul 2024 19:05:50 +0800 (CST)
Received: from lvm.. (unknown [112.22.233.190])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxfceMMIVmHIU5AA--.3488S2;
	Wed, 03 Jul 2024 19:05:50 +0800 (CST)
From: WANG Rui <wangrui@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Xi Ruoyao <xry111@xry111.site>,
	Xuefeng Li <lixuefeng@loongson.cn>,
	loongarch@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn,
	WANG Rui <wangrui@loongson.cn>
Subject: [PATCH] LoongArch: rust: Use rustc option -Zdirect-access-external-data
Date: Wed,  3 Jul 2024 19:06:24 +0800
Message-ID: <20240703110624.1301830-1-wangrui@loongson.cn>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxfceMMIVmHIU5AA--.3488S2
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoWruF48WF1rJFyrJr48Ww15trc_yoWkCrX_Wa
	13Jw48Ka1rWrs0va15Zr1rGrn7C348JF4fZF1vqr9xJryYgry5trZrGw1fZrnaq3y2grs5
	GF4xZasrZr1UtosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU70PfDUUUU

-Zdirect-access-external-data is a new Rust compiler option added
in Rust 1.78, which we use to optimize the access of external data
in the Linux kernel's Rust code. This patch modifies the Rust code
in vmlinux to directly access externa data, using PC-REL instead of
GOT. However, Rust code whithin modules is constrained by the PC-REL
addressing range and is explicitly set to use an indirect method.

Signed-off-by: WANG Rui <wangrui@loongson.cn>
---
 arch/loongarch/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 8674e7e24c4a..ae3f80622f4c 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -105,7 +105,8 @@ KBUILD_CFLAGS			+= -fno-jump-tables
 endif
 
 KBUILD_RUSTFLAGS		+= --target=loongarch64-unknown-none-softfloat
-KBUILD_RUSTFLAGS_MODULE		+= -Crelocation-model=pic
+KBUILD_RUSTFLAGS_KERNEL		+= -Zdirect-access-external-data=yes
+KBUILD_RUSTFLAGS_MODULE		+= -Zdirect-access-external-data=no
 
 ifeq ($(CONFIG_RELOCATABLE),y)
 KBUILD_CFLAGS_KERNEL		+= -fPIE
-- 
2.45.2

