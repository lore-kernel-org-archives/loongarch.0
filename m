Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599F643DA4C
	for <loongarch@lists.linux.dev>; Wed,  8 Jul 2026 14:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519579; cv=none; b=JYco/ouMxfvAH+oly2gEotgD8kCC7MwRobK2ZiwXQdvWfKmw5hM9I0KkIlYhzvjZN2aLupSvmYKKwa6ZGLT/Ig54CSEzQWOlaPEqmsKLBYUk8JC6qeowmpcAT3nj1ARPEs/PcUAV4PTDvurnjoCB/EviZOKEiMdWS/9Vfx+QJRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519579; c=relaxed/simple;
	bh=7xNbzB9jjCG6bvFrhPqvltUsQggTUJDVxMLHfoYPPD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i3btHORrzrh+gQ1YpiLG6KPGwsP3rJ8eX+tbajzTpQ4wJO7wVB9lg/x7R8NXZDXOfshqdRQiKOf+pMz5C6dt9eqaXVaZ6mTsFm667LLlM6xYu04qLU9jnkNzM2Ui+hnBv8BphVzxNYVqUd9WCi0KmTAWArf76birJV5+ohi/a+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Qv4MRnfp; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Qv4MRnfp"
Message-ID: <69e0b5f5-ea05-4740-a7a6-4ea4ab67cf92@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783519575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=msVeMcRLOPlLNlcheQfQ90JtoLtKfwLl8M9ATng8S8I=;
	b=Qv4MRnfpwg+HDy8x1ionVzTwx5xV395lLCKUqh0QrYMoaXh365/t18M5YNYJa7IQgCCdut
	9qH/jMPLwto3MKysZqAF0ljcvywS3Tayvd7lkKsTHfAVbLgKR0t1s0cyMTfGH0AysxXmHf
	h1Wvs/6sKrnUEQux4x3IRvtiRIxlvBA=
Date: Wed, 8 Jul 2026 22:06:04 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v9 0/2] Introduce jit_required to prevent a
 kernel panic
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>, KaFai Wan <kafai.wan@linux.dev>
Cc: bpf@vger.kernel.org, loongarch@lists.linux.dev,
 Puranjay Mohan <puranjay@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@kernel.org>
References: <20260708101806.18885-1-yangtiezhu@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <20260708101806.18885-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2026/7/8 18:18, Tiezhu Yang wrote:
> This series introduces a 'jit_required' flag in struct bpf_prog
> to track programs that strictly require JIT.
> 
> The aim is to prevent a kernel panic by rejecting programs with
> inlined helpers when JIT is not available.


lgtm,

Acked-by: Leon Hwang <leon.hwang@linux.dev>


Beyond this fix and the other assorted interpreter fallback issues [1],
I think it's time to come up with a plan to retire the interpreter,
given that it's considered a security hole. I'll post an RFC on
interpreter retirement in the near future.

[1] https://lore.kernel.org/bpf/20260626154330.33619-1-leon.hwang@linux.dev/

Thanks,
Leon

> [...]
