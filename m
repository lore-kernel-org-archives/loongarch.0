Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F5C2EC56A
	for <loongarch@lists.linux.dev>; Thu, 21 Aug 2025 13:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755784348; cv=none; b=qMKs643PrM+jicG3g+2rYDdRYTsNqZ/ZnjO2QcUVi04Kz41dSOno5rKb8e+SQHzXUeXwaHtbpTIXNbDW4uS+bjyLBP82cKiXnlF/u+b6w7pFDXMbfvtwU18UdE6rDmOxA/GY60EfO7rKCTiOccxYTU7iSPNSpZMdmQ+3sbptDs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755784348; c=relaxed/simple;
	bh=nRoVIFHV/eK+TRh5s6v8ZLdGDcFTurK0WaMx3km/nWM=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=K8LNA4XvBSynGpnl87Dl4MP/mD2ygOXZCkjpf2vSnN8b5UxaSQH4U5oHmby74RFjGkFhrgr3rI3b4FkK4NPb3YuqQcAl3S3g+A55CxPX+Qop2dSQMhAQ6lld9LVRZLyVuJB8U2Un3lkvhBwt4UFHLw6wXh+D3fKItWU0VMDVr94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxvdKWJKdoO3UBAA--.2646S3;
	Thu, 21 Aug 2025 21:52:22 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxQMKUJKdokcFdAA--.20579S3;
	Thu, 21 Aug 2025 21:52:21 +0800 (CST)
Subject: Re: [PATCH 2/3] LoongArch: BPF: Sign extend struct ops return values
 properly
To: Hengqi Chen <hengqi.chen@gmail.com>, chenhuacai@kernel.org,
 jianghaoran@kylinos.cn, duanchenghao@kylinos.cn, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev,
 vincent.mc.li@gmail.com
Cc: bpf@vger.kernel.org, loongarch@lists.linux.dev
References: <20250821091003.404870-1-hengqi.chen@gmail.com>
 <20250821091003.404870-3-hengqi.chen@gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <b4abb062-f11b-2246-ac9e-02c871e68e86@loongson.cn>
Date: Thu, 21 Aug 2025 21:52:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250821091003.404870-3-hengqi.chen@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxQMKUJKdokcFdAA--.20579S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GF43JF1fGFWkuw45AFWfXrc_yoWfJFcEkF
	Z3ta4DCr18Ww1rAw40g3s3XF97Z3s0gr18Gw45Xr93K34YgryxAFsYqry5J3yxArZ7Jw4a
	q390yF1SkF4S9osvyTuYvTs0mTUanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbDkYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAaw2AFwI0_Jrv_JF1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa02
	0Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_Wryl
	Yx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI
	0SjxkI62AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JV
	WxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU0epB3UUUUU==

On 2025/8/21 下午5:10, Hengqi Chen wrote:
> The ns_bpf_qdisc selftest triggers a kernel panic:
...

> The bpf_fifo_dequeue prog returns a skb which is a pointer.
> The pointer is treated as a 32bit value and sign extend to
> 64bit in epilogue. This behavior is right for most bpf prog
> types but wrong for struct ops which requires LoongArch ABI.
> 
> So let's sign extend struct ops return values according to
> the return value spec in function model.
> 
> Fixes: 6abf17d690d8 ("LoongArch: BPF: Add struct ops support for trampoline")
> Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>

The following related testcases passed on LoongArch:

   sudo modprobe test_bpf
   sudo ./test_progs -a ns_bpf_qdisc
   sudo ./test_progs -t struct_ops -d struct_ops_multi_pages

Tested-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Thanks,
Tiezhu

