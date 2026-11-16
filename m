Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801557;
	b=qkXm20hIZZMfgRAWMhzVgBv4yt3Mh5luNHO47ObGo4GZi2qlTk0NJb2EFQQczKZQKJuE
	 kYU8hDOUpVWZnd6txul/JeyM7GAvShc5ASarRu+B1KNa0GxVYh2U/xAhfIn+hDhPALouT
	 Waj4HGAl/upHH+bZOu/ijTPC+0SvAlrHAgbZALwpCZ0gxWRj73QZvg5Z/M9Ubv1cNqVKs
	 5Wko58lTUT1Yq4zC9y8hvFasQLvWbTLj6FAVC2CJkAg1LecJPKKI/9Dn7Af2KF7hw8f+m
	 G9Y1gaCGl5p+ID+0JVmeh1IHCqPZC9MJBGiBZsx92A77BuJ/DbLifCf8+0ovi6C048g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801557;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=j5y/xB7R2/Z2LDaXzlFtsMtmuvZKAkljLigBDMKHnPI=;
	b=YyXo78GB5wNKWAW03GDUeueX4xsXuEV2rx08AZUb/DUhWNBBV8OIwKCwO94VOotXUeW5
	 y/2ksfVfsROIU1T1Q8gWV8pmmYcGyOBFzRDN2FH5kTggWTcsZvfvX+j8/UJNBealUYh7F
	 vGd6DjNaTMnjv4FSv7rqBFX15WQbzInfNKZLDQr0j4cyl8Wwyb5FEyVb3QFovEylcHCjA
	 TXEH7LzTLHxFvIyT86+LyDosnQDdOMowzOB/hXMcAXEzrrq3kBZQYVu975yGVNbC5+8W9
	 gikRbqihTLSjEXo9oWzkjJJuS14Hx0UPOsrPuBvbetljo4zkS6m+GUM+yRFU3O+CjVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73D39606A89F
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 03:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73D39606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8CxfdKSf_pqRwAgAA--.26688S3;
	Mon, 16 Nov 2026 11:59:14 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJBxJs2Mf_pqKNE0AA--.64529S5;
	Mon, 16 Nov 2026 11:59:11 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3 3/4] selftests/bpf: Fix unaligned access failure in fexit_bpf2bpf
Date: Mon, 16 Nov 2026 11:59:06 +0800
Message-ID: <20261116035907.4215-4-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20261116035907.4215-1-yangtiezhu@loongson.cn>
References: <20261116035907.4215-1-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJBxJs2Mf_pqKNE0AA--.64529S5
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ww1DZrW8Jw1rAFW5ZrWDAwc_yoW8KFWkpa
	97A34jkryIg3W5X3Wjyw47GFWFgFn7tay8Kr1rtr98Zw1DJry0qr1fKF1UKF9xW39Yvwsa
	vas7KFZ8Z3ykXabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

When executing "./test_progs -t fexit_bpf2bpf", there are 5 subtest
failures on platforms where CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
is not set, as the BPF verifier enforces strict alignment checks:

  ; tcp->check++; @ test_pkt_access.c:98
  226: (69) r1 = *(u16 *)(r2 +16)
  misaligned packet access off 2+(0x0; 0x3f)+16 size 2
  ...
  libbpf: prog 'test_pkt_access': failed to load: -EACCES
  libbpf: failed to load object './test_pkt_access.bpf.o'

Rather than skipping the tests or setting BPF_F_ANY_ALIGNMENT to
bypass the alignment check, fix this at the source by applying a
bitmask 'off &= ~1' right after the initial range check.

This explicitly communicates the 2-byte alignment state to pass
the verifier and run the full fexit_bpf2bpf test matrix.

Before:
  $ sudo ./test_progs -t fexit_bpf2bpf | tail -1
  Summary: 0/10 PASSED, 1 SKIPPED, 1/5 FAILED

After:
  $ sudo ./test_progs -t fexit_bpf2bpf | tail -1
  Summary: 1/15 PASSED, 1 SKIPPED, 0/0 FAILED

Fixes: 6dc03dc71387 ("selftests/bpf: Add test for freplace program with write access")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/testing/selftests/bpf/progs/fexit_bpf2bpf.c   | 1 +
 tools/testing/selftests/bpf/progs/test_pkt_access.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/fexit_bpf2bpf.c b/tools/testing/selftests/bpf/progs/fexit_bpf2bpf.c
index f4bbf87b82dd..ed06345825e2 100644
--- a/tools/testing/selftests/bpf/progs/fexit_bpf2bpf.c
+++ b/tools/testing/selftests/bpf/progs/fexit_bpf2bpf.c
@@ -173,6 +173,7 @@ int new_test_pkt_write_access_subprog(struct __sk_buff *skb, __u32 off)
 	if (off > sizeof(struct ethhdr) + sizeof(struct ipv6hdr))
 		return -1;
 
+	off &= ~1;
 	tcp = data + off;
 	if (tcp + 1 > data_end)
 		return -1;
diff --git a/tools/testing/selftests/bpf/progs/test_pkt_access.c b/tools/testing/selftests/bpf/progs/test_pkt_access.c
index bce7173152c6..21f28a762d60 100644
--- a/tools/testing/selftests/bpf/progs/test_pkt_access.c
+++ b/tools/testing/selftests/bpf/progs/test_pkt_access.c
@@ -91,6 +91,7 @@ int test_pkt_write_access_subprog(struct __sk_buff *skb, __u32 off)
 	if (off > sizeof(struct ethhdr) + sizeof(struct ipv6hdr))
 		return -1;
 
+	off &= ~1;
 	tcp = data + off;
 	if (tcp + 1 > data_end)
 		return -1;
-- 
2.42.0

