Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 107C223643E
	for <loongarch@lists.linux.dev>; Thu, 31 Jul 2025 02:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753929003; cv=none; b=pLBgTs6+H2G55EqtslhC8Z+oSIWm8XrOp8otlBvzX2ozJbGxlFOb+I1tk9Rd1cN7Na5sdF4z+zTMLzdx4z1rj6P0O7LgBWSP5gQuFgbH1SliMHDDo0pD3rsBG/jjgm9zvqTTFJRrv1FmIhe8pvFnQpZwUmLEKYrb3j24ohU3igM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753929003; c=relaxed/simple;
	bh=rCuSpTGnsvHcj24lVJMV3BUvZWXicvV+Sdo/ybFRY5U=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=N5wJ855UAbY83vaVHcGOC6u7iSP6ED/g92MyyBkvIUSiD5ZmvjavvE3SniWw6+bXogQKcxRoPCICbzUtdB63BvMWpJJAplPdbjwo8OKWMo1WtGXYqT9X81JZjRD1b1YHZ6V+4b5ZTSq8z5uGq2o5aBAtn1VE56wXzuvVB4m6k0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8BxJHAb1Ypo0p41AQ--.452S3;
	Thu, 31 Jul 2025 10:29:47 +0800 (CST)
Received: from [10.130.10.66] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJAxE+QY1Ypo7bcuAA--.37610S3;
	Thu, 31 Jul 2025 10:29:45 +0800 (CST)
Subject: Re: bpf selftest build error - undeclared function
 'bpf_qdisc_skb_drop'
To: Vincent Li <vincent.mc.li@gmail.com>,
 Chenghao Duan <duanchenghao@kylinos.cn>, loongarch@lists.linux.dev
References: <CAK3+h2z3Zx+0KbVcRbLuz_-LhBwov9Bmvp9HdumbaN5GYtovFg@mail.gmail.com>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <0fe044d3-f36a-d7a7-3ce3-237da83eaea2@loongson.cn>
Date: Thu, 31 Jul 2025 10:29:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <CAK3+h2z3Zx+0KbVcRbLuz_-LhBwov9Bmvp9HdumbaN5GYtovFg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJAxE+QY1Ypo7bcuAA--.37610S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7XFyrGr1kWFWxuF1DJF1rXwc_yoW3uFcE9r
	n3W3Wqyw4rXw48Jw129F1fZr93GrySvFyFyw48trZ3A345u3yDtw1YgFZ5ZrWkAw43Waya
	yFnavFs8ArW29osvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr
	0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUzsqW
	UUUUU

On 2025/7/31 上午10:21, Vincent Li wrote:
> Hi Tiezhu and Chenghao,
> 
> While attempting to test the bpf trampoline patches on loongarch on
> top of https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git,
>   I ran into bpf selftest build error irrelevant to the bpf trampoline
> 
>    CLNG-BPF [test_progs] bpf_qdisc_fail__incompl_ops.bpf.o
> progs/bpf_qdisc_fail__incompl_ops.c:13:2: error: call to undeclared
> function 'bpf_qdisc_skb_drop'; ISO C99 and later do not support
> implicit function declarations [-Wimplicit-function-declaration]
>     13 |         bpf_qdisc_skb_drop(skb, to_free);
>        |         ^

Please enable CONFIG_NET_SCH_BPF.

net/sched/bpf_qdisc.c
bpf_qdisc_skb_drop()

net/sched/Makefile
obj-$(CONFIG_NET_SCH_BPF)	+= bpf_qdisc.o

Thanks,
Tiezhu

