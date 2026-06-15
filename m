Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677A013A3ED
	for <loongarch@lists.linux.dev>; Mon, 15 Jun 2026 01:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781488183; cv=none; b=kIzyOFyd2EtQkpqJIzAqWn0tlPdi7MQjvhzG6A/onuevWeKMYNzpqWgXsATWpPcqwO+QvalMi9HaL6JDprUW6G319RVL16+jDjDRfwrQ5T6UUUhpW9SCpnstYwKzzV+DJw/Ff51JiuzT5CATEDsnXEpOZZ0ZLQRTxY7BGx948go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781488183; c=relaxed/simple;
	bh=KltaF6PhiiYHXydkZQTOHE7CWs7Uc5vJx8ckI9GWbEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j4KFsOnMXbWlQ4+VjYFfA/GK3PXnh1t6rI0op3mmqk7bet13h7W+/E4fcTl4HxlFiXejvqQ2lo3tlqWuTX70RYn+EIE6akdP2ugwcCvxaFq/aGyzFr73s8e4/iC79L5bYFHBtseC5WbChpcyVHci/iN0NL+Ig6sjcFxK/OLivnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XXFcrg0M; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XXFcrg0M"
Message-ID: <f8d1b14f-e577-44bf-baf7-fe9da871889d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781488170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KltaF6PhiiYHXydkZQTOHE7CWs7Uc5vJx8ckI9GWbEQ=;
	b=XXFcrg0MtpNMNomWtUxq/Hoc8mcVoO8tbr+9wYIxqvahoXfJCtErSvmIlrGUvRmENisCEX
	bUxwC0/k1QHD8msADB7BglT4Cp6XSvMwB+yqh0jm95tiLUsS9zOHS+O7+P9un4GW7qs5sD
	yOakivdFos1rN1xP0f2NgdjkUu7QA0I=
Date: Mon, 15 Jun 2026 09:49:22 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v2] bpf: Fix unaligned interpreter panic on JIT
 fallback path
Content-Language: en-US
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Xu Kuohai
 <xukuohai@huaweicloud.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>
Cc: Puranjay Mohan <puranjay@kernel.org>, loongarch@lists.linux.dev,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260611101216.30153-1-yangtiezhu@loongson.cn>
 <093f957d-3d3a-4ce7-b59b-06203c556629@huaweicloud.com>
 <9c84609b-3b82-9a43-0f25-4ac632109819@loongson.cn>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Leon Hwang <leon.hwang@linux.dev>
In-Reply-To: <9c84609b-3b82-9a43-0f25-4ac632109819@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 15/6/26 09:23, Tiezhu Yang wrote:
> On 2026/6/12 下午8:37, Xu Kuohai wrote:
>> On 6/11/2026 6:12 PM, Tiezhu Yang wrote:
>>> When an architecture implements bpf_jit_inlines_helper_call(), such
>>> as LoongArch, ARM64, and RISC-V, the BPF verifier skips rewriting
>>> the helper call offset (insn->imm) during the bpf_do_misc_fixups()
>>> phase if the helper is expected to be inlined by the JIT compiler.
>>> As a result, insn->imm remains as the raw helper enum ID.
>
> ...
>
>>> +static void bpf_fixup_fallback_inline_helpers(struct
>>> bpf_verifier_env *env, struct bpf_prog *fp)
>>
>> The function name is a bit long for a static function
>
> If there are no objections, I will shorten the static function
> name to bpf_fixup_inline_helpers() in v4.
>

I think bpf_fixup_inline_helpers() is not accurate, since it is to fix
those non-inline helpers here. bpf_fixup_non_inline_helpers() is a
candidate. However, a shorter name is preferred.

Please provide changelog btw. For a single patch, you can provide
changelog here.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
Changelog:
v3 -> v4: xxx
---
 kernel/bpf/core.c | 28 ++++++++++++++++++++++++++++

Thanks,
Leon
