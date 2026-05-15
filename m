Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC8C36A030
	for <loongarch@lists.linux.dev>; Fri, 15 May 2026 02:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778813541; cv=none; b=Se/ZB2MSQz2ZPfDKuXdn6dbdwSeaiQWVBf8jjQBRvaQLEUPeu9yFtfxQJWy4tBK9Cge1E8OI3DxtYqLXdw8df0EEMc9zbc+Kx8ZF4ZrX7M8fuDclHJuN/5QOHmDVccvD08gG15rv3f7u03fzDAF8wkqrFcbrPi9niCBhB6CG/dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778813541; c=relaxed/simple;
	bh=cXXl1Tvpa3tdUbD1ZB1smegsPoHqw63mQRHvC4Xi6e8=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=PQfffZ1T8VadeJ43NjYlDD3POBefqBP4bFRQdo9e8ELl0s6rcGId0Qt4SGljlB1vjcitB1CG6IOsIjLA6om1IFKdLAfRmOvYz1U3OwAoBo87a174cIxoFvWnLN2LT+7EKuMOUAZjpT21YCOKjlOr4XrSGpMYnxOxakfj6ACGVxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxrcBaigZqZ_oJAA--.6497S3;
	Fri, 15 May 2026 10:52:10 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxLMJVigZqpvKCAA--.51038S3;
	Fri, 15 May 2026 10:52:06 +0800 (CST)
Subject: Re: [PATCH v1 0/4] Fix ftrace and kprobes issues for LoongArch
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>, Lisa Robinson <lisa@bytefly.space>,
 WANG Rui <r@hev.cc>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260512082029.2131-1-yangtiezhu@loongson.cn>
Message-ID: <e7100f76-01f4-0dce-f774-045163d10f30@loongson.cn>
Date: Fri, 15 May 2026 10:52:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260512082029.2131-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxLMJVigZqpvKCAA--.51038S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JrWfJw13ZrW3GrWrGF17Jwc_yoWfWwc_ua
	9Fk348C3y8CwsYya1xKFy5XrZ7GrZru3yUKrW8WF92g3sYgrZrZFZ7Wrn3Zw18WrZ5XFnx
	GrsFgF45ZF12gosvyTuYvTs0mTUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbxxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67
	vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
	wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc4
	0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
	xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxU7_MaUUUU
	U

On 2026/5/12 下午4:20, Tiezhu Yang wrote:
> This series addresses ftrace and kprobes issues observed under heavy
> tracing loads.
> 
> Tiezhu Yang (4):
>    LoongArch: ftrace: Fix stale per-CPU kprobe state after task migration
>    LoongArch: kprobes: Use larch_insn_text_copy() to patch instructions
>    LoongArch: kprobes: Fix single-stepping instruction slot preparation
>    LoongArch: kprobes: Fix handling of fatal unrecoverable recursions

Hi Lisa and Rui,

You are right, please ignore the patch #3.

Hi Huacai,

Please disregard the patch #1 and focus on the patch #2 and #4.

After thinking it through, it is better to avoid calling functions that
might sleep in the probe handler. We have modified the test module with
a proper way, there is no problem thereafter.

The right way is to prevent the problem at the root instead of trying to
fix it after the fact.

Thanks,
Tiezhu

