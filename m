Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798483B38AD
	for <loongarch@lists.linux.dev>; Tue, 24 Mar 2026 15:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774366929; cv=none; b=Rn8UFJZ14n8On3h2wfESYwpBNu0SKxZL/A+Qh4QUFhYFrj685seMNe1HH7jntp1pLhDviWgu66tNkh8L1Thi82+qFwgvy1hj34JjMC44QTyI6TTiWUCa2Z+H342LrDejZR6uoBqwKDSmmsfP7WgNTqGQkkK+ZCxhbqL6F8JdwIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774366929; c=relaxed/simple;
	bh=y2qdM0vVbdDWPFJE2VO5KPJHINtDKQtnoBNOpJBCJSU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GMPQILz0eqCFV4EWXUsK1MaT6bB4HkD7pTNe18Ec8Vnr2n8+hArA7u8toCrkUhOhQga6nMs2OL8FgA5y0yrg50O+WqcPNmOzs1ktKm/hk7h/KWuf3BPNUVoT04mHSBvrVuUwB0fhjLhTUa0R6DE6kAzQ8j0vC2cIHsj2Iqsx2QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=dcqdRMMQ; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="dcqdRMMQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1774366916; bh=X+/J9odCGJ6RNheltOTiGN9mJ2WtSKY4rQgcSUR3a/w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=dcqdRMMQAPPo9RCi1Gl/Hc09EE7d5BUC/VEduZiyASFHTDdwRTGiFCRR7hd37e8Sm
	 xtd91xu2K5W3UEpRng9LMZdUA8U6FvM8JP81uUscVBztZ7bEyHq0+fcZmwxAjuUj7O
	 o6qig91qAPkPtdBERgi7E+WpBfpflaEReiRkqJ/w=
Received: from [198.18.0.1] ([122.195.139.226])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id A2DA9C78; Tue, 24 Mar 2026 23:40:45 +0800
X-QQ-mid: xmsmtpt1774366845t9i05wxn6
Message-ID: <tencent_8862A8A2CC025DA4A7364DE3BC36A685000A@qq.com>
X-QQ-XMAILINFO: OATpkVjS499uVABu7X+9igjh8n4lZg04lk5yQWA6pt/ngkUF29rmNJE0kS0w6W
	 Z1vQFQqQdcrkhGbujJ/bPSmT1PpGA6pt9ec4KQv67bzfyLlxHIQJlO/5Q/BfrOCWHEBIL8yGHtr6
	 SiZa+5GH1McKehNHhY6maJKUc8oiSpKrllTgNX2qmcXpwSib9G+4PPTVIc38KLOw6KULqsA4G3sN
	 bcB00DkBfvJ01aou+XGeP89Diog7LgfkU9hCllGEj18CHLc1cDe631npNfmcSFbprJ6K6TksM5i9
	 YQQ0Iog2cDfMHwCeZ5SIR6+w3h7tVKNUV9Pr7vIa9Oh++8LTy2bp0qups7pByHXq6D+2SW3QI8kO
	 BXnv0B5O64+Da7I8yOY2UQo8CXL50GincowXLk09dSwuBssCNZRFAn5OSCiZDcB/6QaXdym2Klnh
	 FL7trPSx+x2R7nu+D0QITdFBoATdNKR2DhI/DLacrYHrLp4Uwo+JLTmTKHAW1jxvvwOaEQLQtyco
	 a/XkIIXqa2WYq0s2KZOTgXzcfq4ynrx4PzirRboNioAarav9k7Bb97Uep7q84W2zLZ3svFmjMWlp
	 30e47a2D4D+nv/j8X/S1in8aaT4Ncg7cVgWksCP+AGqEyZhXNNyTCeNSR/wP1M9dl8LopEe7EG5S
	 lLYORACjRZceF2c0G4cE0Rl6E5st5sjTWJnStPHlbbfQENnU0DVRyFQ0B7AdCWgsfgGTgsT9SSjt
	 NQsVYpsBfxOebe5Q7GmYO9PSZgSBHrQdDhZR53lTa0Ba7Lxr/84clHkXvJVUbiNWUGvKgE8Q9Gn3
	 MQJjVSYyE32tfLwMJMyzNoQC+8sAcBXlLUs+K7jila/l52gErcPryfFtyEa4bCLC0OQxU/kUdufb
	 D2/Q0UiY+SOnl+YtiTdpwwh6o2x4WfoZER+uvXi209R2t+dbzPeUQwZs8gVGtUrQXPdzgqckOOEg
	 TEjOt73gsaaxIFIXA53iQUAA9x4I+if5TYFhuTcHfKrybJYDR7NPi7cLNO0LS9zZhhwXk2MUzQaq
	 lP8TDxZg==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-OQ-MSGID: <0f918668-e054-4c9f-9710-d994c28b1007@qq.com>
Date: Tue, 24 Mar 2026 23:40:45 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] loongson2 clk: introduce ls2k1000 specific
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>, robh <robh@kernel.org>,
 krzk+dt <krzk+dt@kernel.org>, conor+dt <conor+dt@kernel.org>,
 chenhuacai <chenhuacai@kernel.org>, zhuyinbo <zhuyinbo@loongson.cn>,
 mturquette <mturquette@baylibre.com>, sboyd <sboyd@kernel.org>
Cc: linux-clk <linux-clk@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 loongarch <loongarch@lists.linux.dev>, kernel <kernel@xen0n.name>,
 devicetree <devicetree@vger.kernel.org>
References: <tencent_AC8D0BB5D4C7698A57A6B42D4038559E5907@qq.com>
 <tencent_78A85ECCF65F70A7A24D63BF52A6BD03320A@qq.com>
 <1d8def7c-bc9d-46c0-8584-67848bf12ef4@kernel.org>
Content-Language: en-US
From: wjjsn <wjjsn@qq.com>
In-Reply-To: <1d8def7c-bc9d-46c0-8584-67848bf12ef4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/23/26 04:30, Krzysztof Kozlowski wrote:
> On 22/03/2026 16:27, wjjsn@qq.com wrote:
>> Please ignore this series. I mistakenly labeled it as v2 (again). I have just sent out v3 which supersedes this one. Sorry for the noise.
>>
>>
> 
> Can you slow down and read the feedback you received?
> 
> Best regards,
> Krzysztof

I just saw the mail now.
I'm really, really sorry.

I don't know why all the emails you sent me
were classified as spam.
Next, I will carefully review the feedback
you provided and make thorough revisions.

I'm really, really sorry

Best Regards,
wjjsn

