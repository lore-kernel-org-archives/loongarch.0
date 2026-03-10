Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176CF347505
	for <loongarch@lists.linux.dev>; Tue, 10 Mar 2026 06:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773125127; cv=none; b=SRLiAMJ3grFFjMusE7+4fRbDXiFX5fvNS366Y5kPvgDoYVzdHRSHbaZPKnUV11OfuIMKj+JsFtv5yMb6WE5I+hQI45uox4L+MJzijgUsbGxod5+OV6oJutrh2kBomAcf2qY4d508j3KK5tkUpos3lcFdKeK1VbuQZrJoB/url+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773125127; c=relaxed/simple;
	bh=0aVAiHmBG3wfAE5Zdb0lJbmJG9vphW+wFTv0ZFo9fDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MyeSiAVPxMC0t693/JubRsddeVh+KUyqXxmmG8Uollpk75TS+xnhCXnbn089o6J2THTR95jnOCs8SarUwCUxcBdhYW2NdpGQ+G4Vh8iuWB/LP7APeHzEh8AGHzSj2ay0Jvk3mrw8VsDjaRTeuhITO8Mn1hMGW8iJzXbrUWM6ACA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxAfH9va9pkWoZAA--.9389S3;
	Tue, 10 Mar 2026 14:45:17 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxOMHzva9p8edRAA--.11000S4;
	Tue, 10 Mar 2026 14:45:17 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v1 2/2] selftests/bpf: Add alignment flag for test_verifier 190 testcase
Date: Tue, 10 Mar 2026 14:45:07 +0800
Message-ID: <20260310064507.4228-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20260310064507.4228-1-yangtiezhu@loongson.cn>
References: <20260310064507.4228-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxOMHzva9p8edRAA--.11000S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7tr1fCF4rXFyUJw4DuFW3Jwc_yoW8Xry3p3
	WrAayqkF92qF1xCFy7AanxWFWrWFZYqay3CF1jkry5Zw18C3srJrWIgF1UJr9Ig395Jw4S
	y3s3ta12v3WkXFXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07j5l1kUUUUU=

There exists failure when executing the testcase "./test_verifier 190" if
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS is not set on LoongArch.

  #190/p calls: two calls that return map_value with incorrect bool check FAIL
  ...
  misaligned access off (0x0; 0xffffffffffffffff)+0 size 8
  ...
  Summary: 0 PASSED, 0 SKIPPED, 1 FAILED

It means that the program has unaligned accesses, but the kernel sets
CONFIG_ARCH_STRICT_ALIGN by default to enable -mstrict-align to prevent
unaligned accesses, so add a flag F_NEEDS_EFFICIENT_UNALIGNED_ACCESS
into the testcase to avoid the failure.

This is somehow similar with the commit ce1f289f541e ("selftests/bpf:
Add F_NEEDS_EFFICIENT_UNALIGNED_ACCESS to some tests").

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/testing/selftests/bpf/verifier/calls.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/bpf/verifier/calls.c b/tools/testing/selftests/bpf/verifier/calls.c
index 86887130a0ef..29e57f0e56c3 100644
--- a/tools/testing/selftests/bpf/verifier/calls.c
+++ b/tools/testing/selftests/bpf/verifier/calls.c
@@ -1521,6 +1521,7 @@
 	.errstr = "R0 invalid mem access 'scalar'",
 	.result_unpriv = REJECT,
 	.errstr_unpriv = "invalid read from stack R7 off=-16 size=8",
+	.flags = F_NEEDS_EFFICIENT_UNALIGNED_ACCESS,
 },
 {
 	"calls: two calls that receive map_value via arg=ptr_stack_of_caller. test1",
-- 
2.42.0

