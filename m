Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C396AF9E6
	for <loongarch@lists.linux.dev>; Wed, 11 Dec 2024 03:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733887099; cv=none; b=et2oNl8d/6vlhJDRbGOYZmmk2l3seMBSNFod3TTfYmptIbGOnG9S/Py2NmLLvrWiPQjXbe1v0Y5XBKKUBf8reMXRFfXxoByan+MsJuDkXbLHALxp7IlEiNqitTURZ5Uph6iMZbV5N3149JFpZF3EwVFhzgtc5h7UXD5WIJr7Gcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733887099; c=relaxed/simple;
	bh=QkSTW9F3qFcRzjMa6X68P/M1552IlmY/hA/8rDBZq/g=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=XMb4f4+Xpet6O/9BQGliNED5QZ3C4OYXFjWvLlcyuFFH3BtfF07G8TLecsFLNjyLU6e1knT+th95Jf7rAaAhLCgVEtdlxZPiVGoP7u+9agVALSVqxzD4mIeDc4j2Zg+BbRMVByK5pnMDtJew4fbQsZV63pyAIgvKBjBcpcCHp4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxieB1BFlngVVVAA--.34286S3;
	Wed, 11 Dec 2024 11:18:13 +0800 (CST)
Received: from [10.130.0.149] (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCx60ZzBFlnsSV_AA--.9359S3;
	Wed, 11 Dec 2024 11:18:11 +0800 (CST)
Subject: Re: [PATCH v5 05/10] objtool/LoongArch: Add support for switch table
To: Josh Poimboeuf <jpoimboe@kernel.org>
References: <20241207015915.1159-1-yangtiezhu@loongson.cn>
 <20241207015915.1159-6-yangtiezhu@loongson.cn>
 <20241209203932.a55zmvjehc27hqjy@jpoimboe>
Cc: Huacai Chen <chenhuacai@kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
From: Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <8747e7fb-f2e5-f3d1-c3c4-1fdd05120bda@loongson.cn>
Date: Wed, 11 Dec 2024 11:18:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241209203932.a55zmvjehc27hqjy@jpoimboe>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qMiowMCx60ZzBFlnsSV_AA--.9359S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW5KFWDArWUAw4fKw13Cr45Arc_yoWxGFc_W3
	4qgrWDCayqqwnYyayUCw1YgF9rKrWjvw15XryFqw1Dtw1kJ395AFZ2gr93A34kXayfGFWk
	Wa1kZ3yfWry2gosvyTuYvTs0mTUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAF
	wI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
	CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
	67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
	IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E
	14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
	W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcHUq
	UUUUU

On 12/10/2024 04:39 AM, Josh Poimboeuf wrote:
> On Sat, Dec 07, 2024 at 09:59:10AM +0800, Tiezhu Yang wrote:
>>  struct reloc *arch_find_switch_table(struct objtool_file *file,
>>  				     struct instruction *insn,
>>  				     unsigned long *table_size)
>>  {
>
> This seems to be a partial implementation as it doesn't set
> 'table_size', resulting in undefined behavior when the size gets used by
> objtool later.   I suppose this patch should be squashed with the next
> one?

OK, makes sense, I will squash them into one single patch.

Let me wait for some days, if no more comments, I will send v6
in the next week.

Thanks,
Tiezhu

