Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607159;
	b=bIW8KQ+eCz0lwsYsSV9KxvtzToZglMHjpJpHOwOm90dW0v6fXAP3VzlJn5FXtgMeDiuO
	 cPcA/H5r5MXFMjVnwOVxCEIX3rw8aqNCuEk0pYCY8mQ9tioSdoqmLkSJynJFygMYDQuRI
	 jWcxT3dCCyQrLP36pJ5SsAgd1dLHdrmM9QIfOpFEMlt3ZZ7l1mmSuO8hbX/BFBy1gNBpU
	 dIfSpGGBdwWl4y6z7vbmdQGpEmS9X/ZcshypW+4E19wXZs/LLd+RW1C84tNRU7pc5NB4O
	 qQE7Qg8H5UECYjNSAEy7c1BurYQXy49hGH/0Gg+qFyXwztf/ECieZdvM5+rVHJek7hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607159;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=rgA3jQowehsD4IDuk6EokEntcsXv8fWxLKITDX8CbVQ=;
	b=rcNLLfAiYnhlDch9Sodl2ysS65rcCvOgrjHuMTYyL0OZVhDbBFXRqFkNgsBG+bfVj0K6
	 NYO2mDyFdur8T7q2AfCZ3e5RORynlWwFdtCSpiGOw+hQhrkI9oytZ5l6J1KeOhUU8uMq2
	 NPAhIQ2woWg3a1eAksFJI9raJxIc5HmswLS+opTwxTrWyqOSPEod9f5t6n56vTIWoS0Iy
	 MjRueKA2wrpgN0G6+PBaudNq2iDwDSi6SiST5ommTnE2QMpG7hLl0NDLBe7+MKbpluxFh
	 WFWMoob7AYtIeE6hWXIYJPOlrq1BfRBsWPsMzt96epY++hwX4OMI70R0rX+Ock5d3oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB8FE606A334
	for <loongarch@lists.linux.dev>; Mon,  2 Nov 2026 08:12:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB8FE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8CxvtLyRehqSXgbAA--.13741S3;
	Mon, 02 Nov 2026 16:12:34 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJAx3c7vRehq5cwxAA--.37701S3;
	Mon, 02 Nov 2026 16:12:33 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v1 1/2] selftests/bpf: Handle EOPNOTSUPP gracefully in test_loader
Date: Mon,  2 Nov 2026 16:12:29 +0800
Message-ID: <20261102081230.7063-2-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJAx3c7vRehq5cwxAA--.37701S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KFW3Aw4DXr1rtr4xJFy7Jwc_yoW8ury7pa
	92gF4jkrZ2q3WS9a1UXa1DGFWFyF4kGFy3Kr1rWrs5Ars8JFn3tr1fta4agFn5GFZ3Z3Wr
	uasFyF4rZF17JFcCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcDDGUUUUU

When loading a BPF skeleton program via test_loader, certain test cases
such as jit_insns/cast_to_user may fail if the underlying hardware lacks
specific execution extensions required by newer features like BPF Arena.

Now that arch-specific JIT backends can dynamically report these missing
hardware extensions by returning -EOPNOTSUPP during object loading, the
user-space testing should handle this gracefully rather than treating it
as a generic loading failure.

Check the errno of bpf_object__load() to evaluate whether a load failure
originates from an unsupported platform capability (errno == EOPNOTSUPP).
If true, cleanly detour execution via test__skip() and branch to cleanup.
This allows test_progs to mark the test status as SKIPPED rather than
logging a false-alarm failure if the feature is not supported.

Before:
  $ sudo ./test_progs -a jit_insns/cast_to_user
  ...
  libbpf: map 'arena': failed to create: -EOPNOTSUPP
  run_subtest:FAIL:unexpected_load_failure unexpected error: -95 (errno 95)
  ...
  #193/2   jit_insns/cast_to_user:FAIL
  #193     jit_insns:FAIL
  Summary: 0/0 PASSED, 0 SKIPPED, 1/1 FAILED

After:
  $ sudo ./test_progs -a jit_insns/cast_to_user
  #193/2   jit_insns/cast_to_user:SKIP
  #193     jit_insns:OK (SKIP: 1/33)
  Summary: 1/0 PASSED, 1 SKIPPED, 0/0 FAILED

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/testing/selftests/bpf/test_loader.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/testing/selftests/bpf/test_loader.c b/tools/testing/selftests/bpf/test_loader.c
index d24e4fedae46..021818afbd3b 100644
--- a/tools/testing/selftests/bpf/test_loader.c
+++ b/tools/testing/selftests/bpf/test_loader.c
@@ -1474,6 +1474,10 @@ void run_subtest(struct test_loader *tester,
 			goto tobj_cleanup;
 		}
 	} else {
+		if (err < 0 && errno == EOPNOTSUPP) {
+			test__skip();
+			goto tobj_cleanup;
+		}
 		if (!ASSERT_OK(err, "unexpected_load_failure")) {
 			emit_verifier_log(tester->log_buf, true /*force*/);
 			goto tobj_cleanup;
-- 
2.42.0

