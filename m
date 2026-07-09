Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145C53F4106
	for <loongarch@lists.linux.dev>; Thu,  9 Jul 2026 09:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588557; cv=none; b=JC48ytS6c0Jucuf3kOAu5DOQH5i6n89FHAoccs3uB3ujGYqkFI6q+v8dmkzE1+5LklQakh+fK0z4l4Iiu0PEPtMFc384MATNOhjc5cM3VT3mimBjL+aE7F23xSRZwdzs9l7M3Zq0kl33G4Xy4EXZfAKMt622o9m0af7fqKJN1uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588557; c=relaxed/simple;
	bh=95kto79XIg/fwnZy8w9ySlHeQVhkoETxSGtvTW7SOiU=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=egMpVYAJ1qGWSsAR3FRfICUcg3nxjxqltK0SkvNs2P8597kJGd/99aFRQshgPdbelJrrC8GZgbII/FBRL0cpz3L9dPQJ5/59VVY6T4ea1fHMdm+gE+b0mx6YIvWktzmXZo8FrGjXrqo/RbxcONBEYMwLWiRqIEM4rGwdwNmKpdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxBOrFZk9qCMsBAA--.2447S3;
	Thu, 09 Jul 2026 17:15:49 +0800 (CST)
Received: from [10.130.40.83] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJBxEuTBZk9qULEGAA--.13628S2;
	Thu, 09 Jul 2026 17:15:46 +0800 (CST)
Subject: Re: [PATCH v3 0/4] Fix and optimize BPF tailcall for LoongArch
To: Daniel Borkmann <daniel@iogearbox.net>,
 Huacai Chen <chenhuacai@kernel.org>, Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260707101508.32283-1-yangtiezhu@loongson.cn>
 <5c81752f-5c57-47c4-afad-7cef78729feb@iogearbox.net>
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <054a69e5-c497-d8de-6acd-1625333d0ca8@loongson.cn>
Date: Thu, 9 Jul 2026 17:15:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <5c81752f-5c57-47c4-afad-7cef78729feb@iogearbox.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJBxEuTBZk9qULEGAA--.13628S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7Xw17Jr4rKry3ZF17Kr1rAFc_yoWkJFX_uw
	nFv3s7GrW8ua13AFn7trs5ZrZ3Zw1jyw1DJrWkXrnrCa47A3s5Wrs8Jry0v398W398Krnr
	Jw4DXF47ZF9IkosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbaAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E
	14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4
	CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1x
	MIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsG
	vfC2KfnxnUUI43ZEXa7IU8PCzJUUUUU==

On 2026/7/9 下午4:58, Daniel Borkmann wrote:
> On 7/7/26 12:15 PM, Tiezhu Yang wrote:
>> Based on 7.2-rc2, tested on a Loongson-3A6000 physical machine.
>>
>> Here are the test results:
>>
>>    $ sudo modprobe test_bpf test_suite=test_tail_calls
>>    $ dmesg -t | tail -1
>>    test_bpf: test_tail_calls: Summary: 10 PASSED, 0 FAILED, [10/10 
>> JIT'ed]
>>
>>    $ sudo ./test_progs -t tailcalls | tail -1
>>    Summary: 1/37 PASSED, 0 SKIPPED, 0 FAILED
>>
>> v2 -> v3:
>>    -- Patch 1: Add Fixes tag.
>>    -- Patch 2: Update the commit message and add Fixes tag.
>>    -- Patch 3: Update the commit message and add Fixes tag.
>>    -- Patch 4: Condense the code comments and update the commit message.
>>
>> No code changes.
> 
> Tiezhu/Huacai, do you want us to route these via bpf-next tree?

Hi Daniel,

Yes, routing via bpf-next looks better to me
because it is updated much more frequently,
allowing developers to rebase quickly.

However, Huacai usually takes LoongArch BPF
JIT patches into the loongarch-next tree.
Let's hear his thoughts on this.

Thanks,
Tiezhu

