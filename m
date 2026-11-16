Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801553;
	b=MvJ2ZhlQaxVjcmx/yRD2kR/Ll/RHbQhWCDQN4h5BK6As2jUAZZOmVF+QGRZjeJ7ydaPy
	 dOXjXBiJ9YSo8ali1bSlH+pDwBhiXniySLjeBDPZSW8MejuNc1CLDSrgxoSN/8ogpODWo
	 31NthD1CZkJUh4ospMw09k4iC7sQI38VBG9ElMrE/xkcwkfyydFKIvIaAijumep2Ku0iq
	 0qA+26kVokSBiItqIM4jIkXRfrXuEt5RNLZjMJTC3hThGGNu7fobypmxA01QIwn6WU4TT
	 N4hm9wEp+3NWEQtWn2my6uBmh+75tR49mG7JEAViwQOo6GAsyjWSiXbT5qcW8RZOAWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801553;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=u/9HiJ1D6J/bSIpqYllMpqKapDFD/PBU/bx4yvfHXM8=;
	b=hNoffQ4zTbcVhcoeZUGXKNt27haXh8pV9eJ785cha6lf2ePtFGV6LgPABd3hU/SAGYCt
	 3cc2IQHxAXgeI0fsiMboriERp1nwyQWY3JhnaiRd73iI6x/gPPFTvNKr+3lhB2Djc5pLy
	 5kKSPIJnjbgTreiFT3rYz05qgb7Ntwhg15HWptYQLt7oYCcdeebYzC78fSdqEkbufHDwb
	 9S6cGTTGhbODaklu8tmw1XX5kKkii+1ARKNt9mWo0v93XMG5i7QzSUeADMiHdP7c+5JoE
	 kY8awpsvgl9FIOJZCNO0KBpNpI5AjtI8sEiwHHwz8SnASYCTKwlltddd7e//x6ZF5KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A43606A329
	for <loongarch@lists.linux.dev>; Mon, 16 Nov 2026 03:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9A43606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8BxrtKNf_pqOAAgAA--.27214S3;
	Mon, 16 Nov 2026 11:59:10 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJBxJs2Mf_pqKNE0AA--.64529S2;
	Mon, 16 Nov 2026 11:59:09 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3 0/4] selftests/bpf: Handle unexpected failures on unsupported hardware
Date: Mon, 16 Nov 2026 11:59:03 +0800
Message-ID: <20261116035907.4215-1-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJBxJs2Mf_pqKNE0AA--.64529S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZF1kZw4xCFWxXFykGr4DAwc_yoWftrXE9r
	48trykXFWDAF90kF1Fg3WkCrWqkw4ru348tFyDWa47Jw15ZF15XF4vyryFva48W393t342
	vFs8Ja9Ykr47WosvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbS8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0c
	Ia020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_
	Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
	xGrwCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jOxhLUUUUU=

v3:
  - Introduce SKIP_TESTS() as a generic utility to avoid fragile
    hardcoded string arrays in test runners.
  - Add missing Fixes tag to the fexit_bpf2bpf alignment fix patch.
  - Add a new patch (PATCH 4) to handle another unaligned access
    failure encountered in jit_insns/tail_call.

Tiezhu Yang (4):
  selftests/bpf: Add SKIP_TESTS() helper for test_loader
  selftests/bpf: Skip jit_insns_arena tests if not supported
  selftests/bpf: Fix unaligned access failure in fexit_bpf2bpf
  selftests/bpf: Allow unaligned access in jit_insns/tail_call

 tools/testing/selftests/bpf/prog_tests/jit_insns.c  | 7 ++++++-
 tools/testing/selftests/bpf/progs/fexit_bpf2bpf.c   | 1 +
 tools/testing/selftests/bpf/progs/test_pkt_access.c | 1 +
 tools/testing/selftests/bpf/test_loader.c           | 5 +++++
 tools/testing/selftests/bpf/test_progs.h            | 8 ++++++++
 5 files changed, 21 insertions(+), 1 deletion(-)

-- 
2.42.0

