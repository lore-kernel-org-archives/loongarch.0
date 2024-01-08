Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3EC7F;
	Mon,  8 Jan 2024 03:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.22.232.245])
	by gateway (Coremail) with SMTP id _____8DxPumsbJtlfgUDAA--.1590S3;
	Mon, 08 Jan 2024 11:31:56 +0800 (CST)
Received: from localhost.localdomain (unknown [112.22.232.245])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx34epbJtldugGAA--.17876S2;
	Mon, 08 Jan 2024 11:31:55 +0800 (CST)
From: WANG Rui <wangrui@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	loongson-kernel@lists.loongnix.cn,
	WANG Rui <wangrui@loongson.cn>,
	Nathan Chancellor <nathan@kernel.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH] scripts/min-tool-version.sh: Raise min clang version to 18.0.0 for loongarch
Date: Mon,  8 Jan 2024 11:31:38 +0800
Message-ID: <20240108033138.217032-1-wangrui@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bx34epbJtldugGAA--.17876S2
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtrW8Ar13AF4UCw45Jw1UArc_yoWftrX_J3
	Z2v3WxZr45Jr4Svan7tFn5Zry2ka93Xw4rCF1rWrWDA340k3s0qF1DJFWDAF1Y9rsrGrs3
	W39FqryxCry7CosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb2kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26rWY6Fy7McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0HUDJUUUUU==

The existing mainline clang development version encounters diffculties
compiling the LoongArch kernel module. It is anticipated that this issue
will be resolved in the upcoming 18.0.0 release. To prevent user
confusion arising from broken builds, it is advisable to raise the
minimum required clang version for LoongArch to 18.0.0.

Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Signed-off-by: WANG Rui <wangrui@loongson.cn>
---
 scripts/min-tool-version.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index c62066825f53..9faa4d3d91e3 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -26,6 +26,8 @@ gcc)
 llvm)
 	if [ "$SRCARCH" = s390 ]; then
 		echo 15.0.0
+	elif [ "$SRCARCH" = loongarch ]; then
+		echo 18.0.0
 	else
 		echo 11.0.0
 	fi
-- 
2.43.0

