Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203EF463B98
	for <loongarch@lists.linux.dev>; Tue, 18 Aug 2026 11:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787054202; cv=none; b=jVJ3dXd/scjVBsVe/WDrePlEzBtwW0Im7O19AWRX9BJeHqqx2V7S/hy5YTnPUj8tRGVQwIW3TXM2kmVD8SYNn8RacX2gBpeBGRr3Pnh8aG9fOm9JIwLfF9n0krCgBLqP6g8ziaM+Cv+XXIRkOyUvNFV61iOTX7suiyPB3914kro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787054202; c=relaxed/simple;
	bh=ga/vqg8/LzdG6CRzQHxdL0ZC9le8D2d/7kcqYNPWNzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GNH1QhCIQ6sCOEs2+DAK/l/scZmpH7HhP812GL7wkNtQ8SBlI+A8DRy8rIlgpb3uqRahVXnTkm9prPsDVp63chrJudGwHU9Hj4Cphghp3S7y9snYc+QUiRBMzsA2BjoV2d8sk3g28B9NZnr+BTgfBNb6OSVVo2tk07qW0ypEexs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aJ4IOPCj; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aJ4IOPCj"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49800c6a846so53059975e9.3
        for <loongarch@lists.linux.dev>; Tue, 18 Aug 2026 04:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787054197; x=1787658997; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yrk9FyukvMF5FeyPP9zZXiY0rd/GtA3//9z9DG/ssnQ=;
        b=aJ4IOPCjGWhOtTcc+S4np9ize/bc46cj+24wdYcYEQLXTKm0uu5vqsbDXL4zC35GM7
         T7kPhdygkHxLDrMiI84D0iXgAp1bVExqAvC61Ib8yI0iu3LNS09/d1ZOYHJgmr6Ha511
         GnPHyZK2sC950XwwKXCvd/hBiShoElxQcC04zFIYubmN0rxQU9hWIJWe8Uq/9Q5OzgP1
         9ODadCvOAkRGorl3Xzp3RxLxx9xHrNBONWKfUjyglKa+NceoeJX7U97yztQ5MOAI6CaO
         U3bhzD/MTWA0fH4C1vl0eale9p07Xu4R2onZL7F0un0NtPvTRivxqZyDGqbnaultphqQ
         /ZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787054197; x=1787658997;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yrk9FyukvMF5FeyPP9zZXiY0rd/GtA3//9z9DG/ssnQ=;
        b=re5SmbQWZ/7+PATrIr/rmVbVOoVDTSXbEZI/k14dzOfxIXxEwfiMUn6BelPOG/wLGt
         uCONKHvk2h/GP0R1Lt/uH0pLvhANql7tq+DRr4DOo6kpJpf1hOkrRwgpesElkgyYXR57
         nwMwsYT6azMAuTgmAytGbdOQJ8wZQG7nN2ljGezEt1KHrzNThMwthWVwNUoEBb0Fy3nk
         ilWSyUUzMx4uj6p57vkTqVm6Q/aYNUfbAqulN/UzTwKfTc2L5oOvshRreAMYyhWxFHqW
         ESxx7v1xqpOjB5Cb/urZVcPoL5gW2XOiVsRzLBJSfpifavO+unYxlJ9d2SgdCRyuEMAC
         PpWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3cVqIi06wa3BlcUyThZmuP8QKSo1f30QAiaAEWIwK+9z7ucawRwULrcyuY3OpPHZrqoI6SY6KQeY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxlBdx5sLOZc8jiD93yARIBIh1I5Druk2Nxu8DWw+5imGzuXTf
	SNS1SgMztChKTfhM5/RG99EwyS949brf1zYgRPfgcYW4jTidSiIjY7H8I1MydTU0nfc=
X-Gm-Gg: AR+sD104sG2F4cxtTPZTuT+uAbk/xeJAi9V/W33WZoxDMqvd4lNp/wN3Zq9wjkKbTm2
	UhqC0PB1hx+MQg5Ke6zRtHMQ9/UB83TbGYt4tQvU1SWHvtYHfi4xb7z6cW4dyAEQr4hgjK4by4b
	V0IDGn8JwCOEElL/ptM2V25m825+pYyF+r+WxNmGiYnTPt/LSZs3AYbcEms2XzkiE2Wn8bqJPTo
	gge0TWMBp6Cckfm+PXb09g7rPJwxuw521AcYZYibhXFXrUuIhgHhWNqh1QIsDy1+7Fc5shS2GcO
	taqJu3GIa+epBgOSstRnicocL7bhY2abMgMfx7lrfjdcs6Kl4sb9f0jWiFWFRvrUIBKsB2JtGsN
	EIX0KvuW6tffTFOAAU+o/jBPRKifJNTnbthArZu5Ts4p+MyK+FcGJqE4ra1s8NSh+ZnKv1Wh4Qd
	cVgtxEKk53rhTALC6GuQNkaOm0bSo5rq9YizJ25JK1Qv9chrrEX+0ZFI2wRYw33ZSku0h4aRJUt
	3KDpPSvrSkOpo22yNaz0MjLXdow2oNttoiD
X-Received: by 2002:a05:600c:5392:b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-4998795d6bemr522363345e9.11.1787054197410;
        Tue, 18 Aug 2026 04:56:37 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482aa084a64sm6241298f8f.17.2026.08.18.04.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:56:37 -0700 (PDT)
Message-ID: <96b0e23b-165d-4026-bdfe-f8cd8ceb36ba@suse.com>
Date: Tue, 18 Aug 2026 13:56:36 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] module/kallsyms: Rename is_mapping_symbol() to
 is_local_mapping_symbol()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 linux-modules@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260812032807.15034-1-yangtiezhu@loongson.cn>
 <20260812032807.15034-2-yangtiezhu@loongson.cn>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260812032807.15034-2-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/12/26 5:28 AM, Tiezhu Yang wrote:
> The helper function is_mapping_symbol() historically checks for both
> local labels prefixed with ".L" or "L0" and mapping symbols prefixed
> with "$".
> 
> Rename it to is_local_mapping_symbol() to better reflect this actual
> behavior and scope, preventing conceptual confusion.
> 
> No functional change.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  include/linux/module_symbol.h | 4 ++--
>  kernel/module/kallsyms.c      | 2 +-
>  scripts/faddr2line            | 2 +-
>  scripts/mod/modpost.h         | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/module_symbol.h b/include/linux/module_symbol.h
> index 574609aced99..ca76ed5cb489 100644
> --- a/include/linux/module_symbol.h
> +++ b/include/linux/module_symbol.h
> @@ -7,8 +7,8 @@ enum ksym_flags {
>  	KSYM_FLAG_GPL_ONLY	= 1 << 0,
>  };
>  
> -/* This ignores the intensely annoying "mapping symbols" found in ELF files. */
> -static inline bool is_mapping_symbol(const char *str)
> +/* This ignores the intensely annoying "local or mapping symbols" found in ELF files. */
> +static inline bool is_local_mapping_symbol(const char *str)

I think the updated comment and the function name are confusing. They
read as if they are about local symbols in general (STB_LOCAL), but they
should refer only to local label symbols (.L<xyz>, ...). The function
would need to be called is_local_label_or_mapping_symbol() but that is
too long.

If you do want to rename this function, one option is to be consistent
with perf, which implements the same filter and calls it
is_ignored_kernel_symbol().

The comment could also be clearer, for example:

/*
 * Ignore local labels (.L*, L0*) and mapping symbols ($*). These symbols are
 * not useful for the kernel, for example, they should not appear in kallsyms.
 */

>  {
>  	if (str[0] == '.' && str[1] == 'L')
>  		return true;
> diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
> index f23126d804b2..a595f8cd29b2 100644
> --- a/kernel/module/kallsyms.c
> +++ b/kernel/module/kallsyms.c
> @@ -294,7 +294,7 @@ static const char *find_kallsyms_symbol(struct module *mod,
>  		 * and inserted at a whim.
>  		 */
>  		if (*kallsyms_symbol_name(kallsyms, i) == '\0' ||
> -		    is_mapping_symbol(kallsyms_symbol_name(kallsyms, i)))
> +		    is_local_mapping_symbol(kallsyms_symbol_name(kallsyms, i)))
>  			continue;
>  
>  		if (thisval <= addr && thisval > bestval) {
> diff --git a/scripts/faddr2line b/scripts/faddr2line
> index 622875396bcf..bda4ea20e39e 100755
> --- a/scripts/faddr2line
> +++ b/scripts/faddr2line
> @@ -243,7 +243,7 @@ __faddr2line() {
>  			local cur_sym_elf_size=${fields[2]}
>  			local cur_sym_name=${fields[7]:-}
>  
> -			# is_mapping_symbol(cur_sym_name)
> +			# is_local_mapping_symbol(cur_sym_name)
>  			if [[ ${cur_sym_name} =~ ^(\.L|L0|\$) ]]; then
>  				continue
>  			fi
> diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
> index 2aecb8f25c87..4173fff2788a 100644
> --- a/scripts/mod/modpost.h
> +++ b/scripts/mod/modpost.h
> @@ -198,7 +198,7 @@ static inline bool is_valid_name(struct elf_info *elf, Elf_Sym *sym)
>  
>  	if (!name || !strlen(name))
>  		return false;
> -	return !is_mapping_symbol(name);
> +	return !is_local_mapping_symbol(name);
>  }
>  
>  /* symsearch.c */

Another comment-only reference to is_mapping_symbol() that should be
updated is in tools/perf/util/symbol.h.

-- 
Thanks,
Petr
