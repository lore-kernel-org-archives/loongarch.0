Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607162;
	b=Ia/dDU0OK2rS1nScyt/DYSOzdzP5mqsCfdP/i6J64VKgp+f6OD2wxYijrPiDgabjaaOy
	 cY2LIQpqhEETq95LQJ/3iZ9S5FJ7lbo50+VGKcdwkzWVZPvscAHtCL3O6ze4TBB+Nd+3K
	 NExoj1qVkxkdnulirY00O40fBhg9lqm5mWwQ75+CTjOMVKoVhVnxzUetc5IQjtbFilYtv
	 L+GS4uCZL1eQcxXBjeikP3UZvFaM/ZEWOjeBsJs/fa+TPpm4F0T57xa2xYLCPTmjX94Fd
	 hvv5ODZCkUmD6bNvvlirb0yfrFC0glJx2Zrd3GEU/ySxpJgWnByPZCIV50I3FWvnTig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607162;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=0XFyu5ohozRsphsglreF2QooKn6bFRpdsO1k5OqAHm8=;
	b=H5R4FQP9L9ukTs8zlgmMYU3FPmBxNS0qXNd/LvxybpopJCRGtqbfCwov8yMOOVE3vxH1
	 nOWyAOg49dypudU8yHaxOGUuqyYqj7bTrE6l0WKuEiIn1SzOwaF/IciJ477IhcBoHx/Fv
	 AqJUEYeIN+OM+D1amPlV7fr7Q7YUksryBj0hxjSNDUNPnBRUaUo+RIXvgg8pMFE2duaYJ
	 z6Bf+qmslz2gfMRW2zZ7/SICXYnvgncj/6S+O37XkjTcPyCUJyFWXdeHP1UbvBfKu6Son
	 4Edv261klSrIsHo1fOrOLc68QzKlmwRCZflWkFkca2QeJPF3Gqj4noqe3V8tydxoS9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BA8606A33F
	for <loongarch@lists.linux.dev>; Mon,  2 Nov 2026 08:12:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33BA8606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8CxPNLzRehqUngbAA--.14164S3;
	Mon, 02 Nov 2026 16:12:35 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAx3c7vRehq5cwxAA--.37701S4;
	Mon, 02 Nov 2026 16:12:34 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v1 2/2] selftests/bpf: Handle unaligned access failure in fexit_bpf2bpf
Date: Mon,  2 Nov 2026 16:12:30 +0800
Message-ID: <20261102081230.7063-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20261102081230.7063-1-yangtiezhu@loongson.cn>
References: <20261102081230.7063-1-yangtiezhu@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAx3c7vRehq5cwxAA--.37701S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxAr1kWF18KF4DCFy5tw1rZrc_yoW5Kryxpa
	s5Aw1jkryfZFySqw1UJa92gFZ5trWkJr1YkF1Ig398ZwsrArn7Xr1xKFW5WF98WrZYvws5
	Z3yIkF9xur4UZagCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUco7KUUUUU

When executing "./test_progs -t fexit_bpf2bpf", there are 5 failures
with the same log:

  ; tcp->check++; @ test_pkt_access.c:98
  226: (69) r1 = *(u16 *)(r2 +16)
  misaligned packet access off 2+(0x0; 0x3f)+16 size 2
  ...
  libbpf: prog 'test_pkt_access': failed to load: -EACCES
  libbpf: failed to load object './test_pkt_access.bpf.o'

This is because CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set
on certain processors that lack hardware unaligned access support.
In this case, the affected tests should be skipped.

Add a get_unaligned_access_enabled() helper and use it to skip the
tests gracefully if the program fails to load with -EACCES.

Before:
  $ sudo ./test_progs -t fexit_bpf2bpf | tail -1
  Summary: 0/10 PASSED, 1 SKIPPED, 1/5 FAILED

After:
  $ sudo ./test_progs -t fexit_bpf2bpf | tail -1
  Summary: 1/10 PASSED, 6 SKIPPED, 0/0 FAILED

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 .../testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c  | 11 +++++++++++
 tools/testing/selftests/bpf/unpriv_helpers.c          |  5 +++++
 tools/testing/selftests/bpf/unpriv_helpers.h          |  1 +
 3 files changed, 17 insertions(+)

diff --git a/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c b/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
index d2f2dcc0f2e1..1c0e93dcb3ce 100644
--- a/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
+++ b/tools/testing/selftests/bpf/prog_tests/fexit_bpf2bpf.c
@@ -3,6 +3,7 @@
 #include <test_progs.h>
 #include <network_helpers.h>
 #include <bpf/btf.h>
+#include <unpriv_helpers.h>
 #include "bind4_prog.skel.h"
 #include "freplace_progmap.skel.h"
 #include "fentry_sleepable.skel.h"
@@ -76,6 +77,11 @@ static void test_fexit_bpf2bpf_common(const char *obj_file,
 
 	err = bpf_prog_test_load(target_obj_file, BPF_PROG_TYPE_UNSPEC,
 			    &tgt_obj, &tgt_fd);
+	if (err < 0 && errno == EACCES && !get_unaligned_access_enabled()) {
+		test__skip();
+		return;
+	}
+
 	if (!ASSERT_OK(err, "tgt_prog_load"))
 		return;
 
@@ -297,6 +303,11 @@ static void test_fmod_ret_freplace(void)
 
 	err = bpf_prog_test_load(tgt_name, BPF_PROG_TYPE_UNSPEC,
 			    &pkt_obj, &pkt_fd);
+	if (err < 0 && errno == EACCES && !get_unaligned_access_enabled()) {
+		test__skip();
+		return;
+	}
+
 	/* the target prog should load fine */
 	if (CHECK(err, "tgt_prog_load", "file %s err %d errno %d\n",
 		  tgt_name, err, errno))
diff --git a/tools/testing/selftests/bpf/unpriv_helpers.c b/tools/testing/selftests/bpf/unpriv_helpers.c
index c8dd5d848584..54ce342b3fe4 100644
--- a/tools/testing/selftests/bpf/unpriv_helpers.c
+++ b/tools/testing/selftests/bpf/unpriv_helpers.c
@@ -161,3 +161,8 @@ bool get_kasan_multi_shot_enabled(void)
 {
 	return cmdline_contains("kasan_multi_shot");
 }
+
+bool get_unaligned_access_enabled(void)
+{
+	return config_contains("CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y") == 1;
+}
diff --git a/tools/testing/selftests/bpf/unpriv_helpers.h b/tools/testing/selftests/bpf/unpriv_helpers.h
index c24d53e14f3a..6e3ad636ea83 100644
--- a/tools/testing/selftests/bpf/unpriv_helpers.h
+++ b/tools/testing/selftests/bpf/unpriv_helpers.h
@@ -9,3 +9,4 @@ bool get_unpriv_sysctl_disabled(void);
 bool get_unpriv_mitigations_disabled(void);
 bool get_kasan_jit_enabled(void);
 bool get_kasan_multi_shot_enabled(void);
+bool get_unaligned_access_enabled(void);
-- 
2.42.0

