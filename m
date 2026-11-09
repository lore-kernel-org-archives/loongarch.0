Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197532;
	b=UEfLXzZli2HWqq5h79EsmDC395mte7rEtSyWFkmIa7Cjc37Pxk7ihgIBVbPGAkuMHAEt
	 YJbzN+dqfcE2wBWWw+U5xI2HUxLLiAX99+JaeASidB5UQUy1QwuWznHVAfRX/pSyrIWpY
	 kY7mBDHC9b4nZMxtbygIEcikk3gB8ZxazLU1QT3Cp1D/TUHeht9+CWzS8YAPgU1gDXmrp
	 qbbC9XTDryIRSx+L6g0s0ediwS0rdfr7Jm/bNlgxacEDJ6/4qp+Gbnh+cUK8cUg+Yk+Db
	 U8qb7SylmSAJ4zOh9iJbJY/G7h+NbcKl4FaSE7YoY2iqyzhHu09NNv6N6Pj/AiNOalw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197532;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=mLjYcl7nqSfbqI9MLwtzTNFgLBO+qZayfevupvctII8=;
	b=QwCP8QPWw70ThGDsY511U63MY9gZ0rIEMG/fHUXXFT0TRVsShyZDCwtlqLa9dtRWgjLZ
	 A1SlogQFQ2c89foVLPaX9+dghzMiKJGc7L4pH/FvGRbwprJZhS0nsYKg5EnBaVi9FLJlF
	 6ilLX0Op22RtfMR0J5z9ITnBj++WaWQUPisMk0Nr4/WCIwTLJ8hvDKBYQWVzkQYKF7T1s
	 O4gynj9KWwKlxwvqE2VWzs/2owYQwJc9Ow5DXTY5xsydPGHbZSK9u7KuOfSbp/DhaeYyT
	 TGyNAPIay2jujp2RgjUKZIWTTs/FoekHfyni9k7sYLHEOSDl87yTt3w5JlWrYABkdWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29056606A325
	for <loongarch@lists.linux.dev>; Mon,  9 Nov 2026 04:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29056606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8Axj9EZSPFqnrMdAA--.20414S3;
	Mon, 09 Nov 2026 12:12:09 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxxMwXSPFqQRwzAA--.11813S4;
	Mon, 09 Nov 2026 12:12:09 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v2 2/2] selftests/bpf: Fix unaligned access failure in fexit_bpf2bpf
Date: Mon,  9 Nov 2026 12:12:07 +0800
Message-ID: <20261109041207.15221-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20261109041207.15221-1-yangtiezhu@loongson.cn>
References: <20261109041207.15221-1-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJDxxMwXSPFqQRwzAA--.11813S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ww1DZrW8Jw1rZw47ArW8uFX_yoW8tFykpa
	s7Z34jkryFg3WYq3WUAw47GFWrKFn2qay8Kr48tr9xZw4DJr18Xr13KF4UKasxW39Yvws3
	Zas7KFZ8ZrWDZabCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07josjUUUUUU=

When executing "./test_progs -t fexit_bpf2bpf", there are 5 subtest
failures on platforms where CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
is not set, because these platforms lack hardware unaligned access
support:

  ; tcp->check++; @ test_pkt_access.c:98
  226: (69) r1 = *(u16 *)(r2 +16)
  misaligned packet access off 2+(0x0; 0x3f)+16 size 2
  ...
  libbpf: prog 'test_pkt_access': failed to load: -EACCES
  libbpf: failed to load object './test_pkt_access.bpf.o'

Instead of skipping these tests entirely, fix this at the source by
applying a bitmask 'off &= ~1' right after the initial range check.
This explicitly communicates the 2-byte alignment state to pass the
verifier and run the full fexit_bpf2bpf test matrix.

Before:
  $ sudo ./test_progs -t fexit_bpf2bpf | tail -1
  Summary: 0/10 PASSED, 1 SKIPPED, 1/5 FAILED

After:
  $ sudo ./test_progs -t fexit_bpf2bpf | tail -1
  Summary: 1/15 PASSED, 1 SKIPPED, 0/0 FAILED

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

