Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A43327BFA
	for <loongarch@lists.linux.dev>; Tue, 18 Aug 2026 11:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787054399; cv=none; b=eKiioq63thynMcnHa/BeMx3coW8s4JKnZpkvPcE6Uzrn4q9LViFRt9/LPWfiT+fNhW/8VcV2tvzzIEl4CSOFUn77uJIXq0Pwhfw88ePMvFOeCHBMN3oCBd8cMJRd2tLEVjWtbT/yC0ZFLaEiRjks0VDmx28pU3U5JidWZE/a77Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787054399; c=relaxed/simple;
	bh=4XrU5DOs80iqMiB8KU7Viwwf3z4yaHMHf4dvuHwXlRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kM2ANWfpec3e9tD0deeG+pPYjeSev+9APMNugNM2QxAAhOP0KmI7YckgoJ5dzVj80Tjo71WPi/Ij4GsOPZlE3f6a9HL+w4hOa0yxTB1Wapxg2lt1WlvCevtBeblLK1y8Jm69bp04t2SiH0kpi2/CdJClwvh4v1sxwZ7Zaf42fyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DDwXqceU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DDwXqceU"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f96c5b722so2834660f8f.0
        for <loongarch@lists.linux.dev>; Tue, 18 Aug 2026 04:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787054396; x=1787659196; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uS9zOAi5LfeCdiC/XsclJmrpHRK7bC0G5EuVG3u99Qk=;
        b=DDwXqceUpjTfbhNt44V2PjpRjZ1Rex8TaHcUN54LRuwP/trMHPaIzEg5HoMPLVdXDf
         JSrY4Gwfbm08/S8MCXZmxLIGt7QaR7ppDKRl9XQyA10DK4soFQhbM1I3E38dTE/qJI09
         /1JkGiiSW2LuQUPrc9R7JS4tYSstrJIGP2Wq4+nkH60GGPQqkS/IQVLKN5FWvccZcgkt
         fYuVwGivCODlUhp+qhYXxSPNVOs4cFYl3JK9JfPwsghETeVVJSHG1QwEmqvt2adzEfb0
         /7ub6DLnbaD+cbXtco0xV0gppRMOGVyEctuNyTAIn7Y9jtN9Iov2y/E25Ix7RPLfBFgG
         c9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787054396; x=1787659196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uS9zOAi5LfeCdiC/XsclJmrpHRK7bC0G5EuVG3u99Qk=;
        b=GAgsY/HddFdxQZ7AsBYeGrHksEnUYC+vNnHWTLtATjnsdw8hPDqHAxbMp12UMTi8Hb
         hQbMTuFqzEEqi3uRbWLNylpaSUwuIm7d7z+Q3sl4+XKUkYEQlxzvU3zpUUP3GdFLJc9h
         CGB3n6pq9CXF9ihfgXqlDT6pKnrXQyHv+a/x+H02Em7Ll4/BJVeJndI1hcxKE6qe0reB
         ngn+3YRZ7iszFIA4nKNMoDL+0GMXqQuSeJFCmE9rdNENK/FrnC4pRj3df0W/J33Wrf/q
         UmtjdqxT3KLk8A5BTmceYaj3236EAwzj8it1/qopBveZQLOgNBFC30ZHR/u2PzGbrbs/
         2Jjw==
X-Forwarded-Encrypted: i=1; AHgh+RpAd4ETcSkheRw6u8P9/XGTx56Bf9QFRSq8JhvwvOF0jJj/NKC2f8pV9KRs6bIJurc3euKX3EpEYi8=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywnc/4+5M/0WfInwbW618duoOUoxSt6fWFp+gL7WUxKVMWFLlhy
	oK222sS/Qh2Mu8Rm4hRhVw+Pof9FcdFboofd+w2aVEiErZk6gAMq+RajHak5bVWR1n0=
X-Gm-Gg: AR+sD13wJq4AhXKfzT4EQNg0R4DhCc5GVmrh5jhY/UUuB/A/7iW3ndpU1iyRi2+4IZ5
	SQ6H+j+sVzffhQ1XA1yd4AqR+pSTIeaFBiF35a4KXlePfExIPT5rzqstyHB5GD4iFR1L01UlgQt
	O3QBewIY2S343IZo/gxX0Vl8C8S5TAek0pdmnptrrbXqzhJmWn79NwqKg5TCSYrKg1kSWCdoxFx
	49xSDQuckjvujgAQb6bRxDizX02jOZg2Sc3XEplaMA4Cr1QJIIlA2nYz+Ko2Oaa95libdcV9TPl
	RX+/Yd4Ohdp0btvkHkCQltKym6B2mDJxs1wABBOC1A7uPIj3k0qaFRdqdhfZ8SyNh0Pc354qHBX
	lF+4ruZN+P9IQha4JMiw1LSGsWANVfYowKE/qEPrKsePshOa6y7MrGGS7vZoSciVL/0hjyBm3jU
	Lyd5jSJx6miksXaCz0v5fSvKRHWqksz3N3ouIMkZ+9aHCM0GWfrt6SkyP+xRj8Wzhf3kJwL0DS5
	ufNk7OnxJoWJTmihnLpFmWS
X-Received: by 2002:a05:6000:46d4:b0:481:f33d:6445 with SMTP id ffacd0b85a97d-482a907b955mr9315513f8f.7.1787054395935;
        Tue, 18 Aug 2026 04:59:55 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a7c603sm12401112f8f.21.2026.08.18.04.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:59:55 -0700 (PDT)
Message-ID: <4e351b13-1670-4813-ac98-e44c00703601@suse.com>
Date: Tue, 18 Aug 2026 13:59:55 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] module/kallsyms: Filter out local and mapping
 symbols during module load
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 linux-modules@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260812032807.15034-1-yangtiezhu@loongson.cn>
 <20260812032807.15034-4-yangtiezhu@loongson.cn>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260812032807.15034-4-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/12/26 5:28 AM, Tiezhu Yang wrote:
> The compiler toolchains generate local and mapping symbols on certain
> architectures like LoongArch for optimizations and relocations.

Nit: "local" -> "local label".

> 
> While the symbols are already filtered out during runtime lookups via
> find_kallsyms_symbol(), they still leak into /proc/kallsyms for loaded
> modules because layout_symtab() and add_kallsyms() do not filter them
> during load time.
> 
> Consequently, tracing tools like bpftrace (which do not perform internal
> filtering, unlike perf) resolve identical addresses into confusing local
> labels instead of actual clear C function names.
> 
> Fix this by integrating the is_local_mapping_symbol() check directly into
> the newly introduced is_kept_symbol() helper. This ensures these unneeded
> symbols are stripped during module load time, keeping /proc/kallsyms clean
> and resulting in accurate call stacks.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

-- 
Thanks,
Petr
