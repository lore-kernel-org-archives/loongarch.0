Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3267B316199
	for <loongarch@lists.linux.dev>; Thu, 24 Sep 2026 02:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790216290; cv=none; b=oMVii1PIHzs9Um+2s0xaORungWGcdl2lKU2FS00aEsm4E2TA+n+I53ErFhnoDR8OUWViaNe8HMvyAuA4lW3iEyYSr1w4+S2Ue+2IE92SmMar3Sk+aAmkD/pVP+nP6NIHLKKQFisI09vrd7VwKLTrnXgcL3PLRrkhoAuTGyIbm54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790216290; c=relaxed/simple;
	bh=LR0Lznm2V+DejXrByG4ku78oGOi+EM4DXA1XZt0mE2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ADYxUl6Bcp881mogIwHRbfySzgd+ar8Mu+8M+qpJj3fsaGbrup4R3hCaAn6sdDEvUJ28criAjO+c9DHaf8dT/1ry2v32yPN+PUlF2Lit5PPvIaHm3oCsVyfEzSGNv6L6o+qgfry0VLtFhSTzS7KUHB/Tv8Kcb1jmmo+6Iedl+q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8BxLNJWiLRqjksPAA--.44823S3;
	Thu, 24 Sep 2026 10:17:59 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxTs9ViLRqY4AkAA--.12023S2;
	Thu, 24 Sep 2026 10:17:57 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] perf loongarch: Fix discarded const qualifier in _get_field()
Date: Thu, 24 Sep 2026 10:17:56 +0800
Message-ID: <20260924021756.22433-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxTs9ViLRqY4AkAA--.12023S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7ZFWxCry8XF1UKryfAw1kJFc_yoW8XFWUpa
	9xCwsrt3y8Wr1fGw1UZryIgFW5WrWxGa4Sva12yFWjyan8W343XFWFq3sxKFy2gw1UJrsY
	vr15Ww1vqF48AwcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AK
	xVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI
	0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07URKZXU
	UUUU=

When building perf on LoongArch, the following compilation errors occur:

  CC      arch/loongarch/util/header.o
arch/loongarch/util/header.c: In function '_get_field':
arch/loongarch/util/header.c:31:15: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
   31 |         line2 = strrchr(line, ' ');
      |               ^
arch/loongarch/util/header.c:36:12: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
   36 |         nl = strrchr(line, '\n');
      |            ^
cc1: all warnings being treated as errors

Declare 'line2' and 'nl' as const char * to ensure type safety. In modern
glibc versions, strrchr() returns a 'const char *' if the input string is
const.

This is similar to commit 7378b6656aa4 ("perf riscv: Fix discarded const
qualifier in _get_field()").

Fixes: 492ac37fa38f ("perf kvm: Add kvm-stat for loongarch64")
Cc: stable@vger.kernel.org
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/perf/arch/loongarch/util/header.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/arch/loongarch/util/header.c b/tools/perf/arch/loongarch/util/header.c
index 0c6d823334a2..46f53a74f71e 100644
--- a/tools/perf/arch/loongarch/util/header.c
+++ b/tools/perf/arch/loongarch/util/header.c
@@ -26,7 +26,7 @@
 
 static char *_get_field(const char *line)
 {
-	char *line2, *nl;
+	const char *line2, *nl;
 
 	line2 = strrchr(line, ' ');
 	if (!line2)
-- 
2.42.0

