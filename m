Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408757;
	b=j3D6S8B1RFzuxk+jyLVT04NdqWtzqGT6/f/50NYi354rd/kDC8TnlQyhZ0ITP/u/6x5j
	 S+dCkdRlYLyre9/uR1v2HsVqKryRxRAfo7QZ2LKfmmR2KKqs5CUtzYsfqnWecC2Ush+s2
	 UW+1KiyVyJhpYX2EMWSsh4T7dcHBF9P1NTaf/Qn+eXY8Mi6cJp7KhAg6l9lVe5TvhRBLU
	 XapAw+tlECvCJBwlGv1+mlBEBUxiy/D1NY2uSQBwFLQz6Yw3d89Zk1mrMcC824UrQNUvc
	 tIKdQHqixUrJre36epB9y6ZJYzzwiTZ4dxi4swBGHK7Irwwuyg1yLIqlR+1D6rt2yWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408757;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=Ja+J7AFjxGVS/OpS76/QrYcf6mps2x4KYVMn+97+OA4=;
	b=D5ipavXPB1qiueerN/u+Gegxrfaq74fGAC7rUJ1yMWooqe2+44XsG0UiT76Lv8VpmAKS
	 0Zh4lR++QJqdfzrf6BzY6htjfq8LCydG8VYirNPJVSw5BCvABfdputGv+46zqmL1bUcgF
	 KnKLqa8tjUqa/9fEx6MKl2vZiFOZ2vYLo+ISDpvHijU0AqUN2WHvNf23aGNH9UeWBpO9J
	 /e9TQGxy3OzFNHufn12fS86KfFc8S9xmsEIRvGcj3jQT54e4O+7iHo5Hqcx4uGd80YQCj
	 +a67zDmGSFm6SOUjqNu+kGEftlnFuuHOaXUb5Zo53TapOcgL+RsWYGzYIoAxqE5b1CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ABFB606A31E
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 04:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ABFB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxX9NwwwNrCh0iAA--.31745S3;
	Mon, 23 Nov 2026 12:39:12 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCxPs9rwwNra8s2AA--.43419S2;
	Mon, 23 Nov 2026 12:39:09 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] LoongArch: BPF: Support instructions array, indirect jumps and calls
Date: Mon, 23 Nov 2026 12:39:03 +0800
Message-ID: <20261123043907.20225-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
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
X-CM-TRANSID:qMiowJCxPs9rwwNra8s2AA--.43419S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtF47Cw4rGrW5Jr4kAFy7urX_yoWkCwcE9F
	Wfua4xArWxtayYka4293Z5AFWDAay8XFyFkFykXry8Xw15Ar1xZFs5CwnYywn7urZrJ39x
	KF42vr1vvwn0vosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb7kYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7V
	AKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCj
	r7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6x
	IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAI
	w20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x
	0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzZ2-UUUUU

This series was created on top of the following unmerged patches,
though there is no actual dependency and git am applies cleanly
without them:

LoongArch: BPF: Fix the offset of stptr.w and stptr.d stores
https://lore.kernel.org/loongarch/20261118071444.10258-1-dongtai.guo@linux.dev/

LoongArch: BPF: Optimize doubleword loads with ld.d and ldptr.d
https://lore.kernel.org/loongarch/20261118081201.10498-1-yangtiezhu@loongson.cn/

Tested with the series of BPF selftests, here are the test results:

$ sudo ./test_progs -t bpf_insn_array | tail -1
Summary: 1/20 PASSED, 0 SKIPPED, 0/0 FAILED

$ sudo ./test_progs-cpuv4 -t gotox | tail -1
Summary: 2/14 PASSED, 0 SKIPPED, 0/0 FAILED

$ sudo ./test_progs -t callx | tail -1
Summary: 6/89 PASSED, 6 SKIPPED, 0/0 FAILED

Tiezhu Yang (4):
  LoongArch: BPF: Optimize BPF_CALL control flow
  LoongArch: BPF: Add support for instructions array
  LoongArch: BPF: Add support for indirect jumps
  LoongArch: BPF: Add support for indirect calls

 arch/loongarch/net/bpf_jit.c | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

-- 
2.42.0

