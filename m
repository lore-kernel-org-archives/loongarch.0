Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390745;
	b=qBvyPgBehgPaF/pFqJvMDI3ep5tNX+20NXERYRsCpVc2006kGNFjZuya1w5A5zC6mObD
	 +oQAeLeQznyIQZXi4GkK6tk7BRjxqH/4Wxt9Z+ksKlWGJC1AicdB8zZwu5j8A8smBvnn1
	 V34QG9Oiz5XT82eHPBEgg7f57x7fkXD8qewoA4EZgREw6zOjFBFuP4DpnDEaArDdOA3Kc
	 D66obKGpMkDahVXXjNmzAoRBVhhpmV6IutPWACrzztRvGrQSD4ak0ZU1DIi/kb8y9eR8b
	 6YZ2HlMDL6QokE7y5yukOaDvBvvnqHMQTPcVGi0C9Slerzsc1jQSaXDMHIH9ncIYQgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390745;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=E6l4GGAmgvSu85gCL1YVNUedtbF84qfhJ1alEiUbsUc=;
	b=eGsTzdEr1f2DQenVKAebY57e3s8SyYwtXzUpqSfSKrwG/WlnQsiow4U0vwT5SmJ6seyM
	 I4JlACoO7E+3B3e54bKU6N72q9GXdjzTv977+uZXsUVv9T9O39v1rdDKizUgZ0u1Qw8+Y
	 vdUw8MRzfaUfdt8km4OTx61o/inowWbSOsVS75PQ/jQi9vpU5xchc1Dx6g2Q4eKiO8oNN
	 G2Y/4N+jxQY2SEQmSLRSV7N2RrwyQDoIcuE1r4zqkpMldB9WfxFzcXV86Er8t8khz2CYF
	 pmyu/X3JQAgQe2PTY3iyRD2OdZspiH30Nq4OlcCL0TeF/PVeqV1AwVGCVkCgeO9LPdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44B9606A321
	for <loongarch@lists.linux.dev>; Wed, 11 Nov 2026 09:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B44B9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8CxutHVOvRqXIEeAA--.22281S3;
	Wed, 11 Nov 2026 17:52:21 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJDxg8zSOvRqrLMzAA--.12000S2;
	Wed, 11 Nov 2026 17:52:19 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/3] Add some new features for LoongArch BPF
Date: Wed, 11 Nov 2026 17:52:14 +0800
Message-ID: <20261111095217.31415-1-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJDxg8zSOvRqrLMzAA--.12000S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
	67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
	ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E
	87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82
	IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC2
	0s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMI
	IF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF
	0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87
	Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcrWFUUUUU

Not tested yet, just RFC.

Tiezhu Yang (3):
  LoongArch: BPF: Add support for instructions array
  LoongArch: BPF: Add support for indirect jumps
  LoongArch: BPF: Add support for indirect calls

 arch/loongarch/net/bpf_jit.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

-- 
2.42.0

