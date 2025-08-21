Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537921F416A
	for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 14:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755784893; cv=none; b=AAcsELG0iFJ9gi/ifxzmlyKfZivRj+Ptxf/YbUO5y2pGm8XjzN5WytNpOV/sp5t/O4KFNttCPzFMdDmR/KOZ4WBipknc9fDjG0CmcK+L3o6BlbTEdCuTx9GFXgaTUO9PicYPnp9eb5EJhr/JhwZ2rTzsAeL92YsGHp8h/XN5QWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755784893; c=relaxed/simple;
	bh=3ehpm10K5W8NSlHoWMV6jzSx1aXWo0UGSFSZEK2dpXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Er6AWnGVCICnSIu5pTztvBRLxTVi0bQuH1pE8BH+33taR4YQq189RsUTgMGvRSYO/2LSEEKvAmLhcXiB39vOPw5aeNzSNnrF/fmUpk+LqqUAcFIW6xdGjcdKUEYv7VoxAa3AqjX5SNoSfvds09wnaklZZa2YvL5LqsOdaGvL2CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bx2tG2Jqdo+XUBAA--.2740S3;
	Thu, 21 Aug 2025 22:01:26 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxpeSyJqdorsZdAA--.26328S2;
	Thu, 21 Aug 2025 22:01:23 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/2] LoongArch: BPF: Add more feature for trampoline
Date: Thu, 21 Aug 2025 22:01:20 +0800
Message-ID: <20250821140122.29752-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxpeSyJqdorsZdAA--.26328S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XF4kCr47AF1xWF4DCrW8Zrc_yoWDWwcEkF
	yfKFyDGw18Wa4YqF9Fqr1fAryDuFW7JryrCF48XrZ5Kr17Xw45Ar4vy34Dur109rs3Xa98
	trnFyry0yryxuosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb78YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_
	Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8QJ57UUUUU==

This is a RFC series, based on Hengqi's series [1]:

  LoongArch: Fix BPF trampoline related issues

The initial aim is to pass the following related testcase:

  sudo ./test_progs -a tracing_struct/struct_args
  sudo ./test_progs -a tracing_struct/struct_many_args
  sudo ./test_progs -a fentry_test/fentry_many_args
  sudo ./test_progs -a fexit_test/fexit_many_args

but there exist some other problems now, maybe it is related with
the following failed testcase:

  sudo ./test_progs -t module_attach

so just RFC for now, I will address the comments and send a formal
series once there are no problems.

[1] https://lore.kernel.org/loongarch/20250821091003.404870-1-hengqi.chen@gmail.com/

Tiezhu Yang (2):
  LoongArch: BPF: Add struct arguments support for trampoline
  LoongArch: BPF: Add 12 function arguments support for trampoline

 arch/loongarch/net/bpf_jit.c | 84 ++++++++++++++++++++++++++----------
 1 file changed, 61 insertions(+), 23 deletions(-)

-- 
2.42.0

