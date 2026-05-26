Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3596E30BF68
	for <loongarch@lists.linux.dev>; Tue, 26 May 2026 07:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779779002; cv=none; b=lxDUyW4Ta6vnq8wnIuYRsCn38d6k44BsYYTUbLtG08oxVc235WBFCBShVHkKDI4/+xmOvKxuhJo17IEPXk4bU6asizpu888NJwHqwc+m/u+yU5P7ngXeFFwcVdz7Da8GVVIKRof+6+Do2XnhLRLG8/HeQFAVcdeH2ZKChAhzrsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779779002; c=relaxed/simple;
	bh=U+58k1Bo3xDne0kGH88XEZZC53AwvJfPG0MScOSgenU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pbr95ccbSqdxnq6bbAp277JdpPVdwVpymPGCNi0Wnw9IxNVr7sPRenNodY+BgRpOmoli+dBw939a765tK0+98AE6DuHD1JlaLIJJoGnjk9akJaU4ny69iIv3k3qzXfug2jg39NZWvyuS6NmvgFPxB7JrVipGJROAEZcSjelN9WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxLuq2RRVqb00NAA--.37582S3;
	Tue, 26 May 2026 15:03:19 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJDxysG0RRVqq1+RAA--.11006S2;
	Tue, 26 May 2026 15:03:17 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] LoongArch: BPF: Fix some tail call issues
Date: Tue, 26 May 2026 15:03:14 +0800
Message-ID: <20260526070316.28228-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJDxysG0RRVqq1+RAA--.11006S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUU9Sb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E
	14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
	I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2
	jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20x
	vY0x0EwIxGrwCF54CYxVAaw2AFwI0_Jrv_JF1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxY
	O2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
	WUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
	Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
	WUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4U
	YxBIdaVFxhVjvjDU0xZFpf9x07UNvtZUUUUU=

Regarding the patch that adds the NOP padding in the subprogram
prologue, drop it for now. I plan to add a new test case under
BPF selftests to fully cover this scenario if possible.

Tiezhu Yang (2):
  LoongArch: BPF: Fix outdated tail call comments
  LoongArch: BPF: Fix off-by-one error in tail call

 arch/loongarch/net/bpf_jit.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

-- 
2.42.0

