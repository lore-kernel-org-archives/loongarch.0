Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05A336215F
	for <loongarch@lists.linux.dev>; Tue, 18 Aug 2026 11:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787054339; cv=none; b=oLVkK8rjAFPWJXgeC26Soj7Yy/uWbgBFqMUrhj58ClMa4qAGOttWh6kUWuJKGdY3DjBzAukYUD+9Bhy2eiWVA6gKsxETLVTosb2rzZQZEEgvpha9xnxvTuuTJMOQbL6qeDqEbQvTA3e/L6Sr0+oza75HnRvT0qzCDMsFAiWeJyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787054339; c=relaxed/simple;
	bh=cBsjwGnq7m3PBpDVHoEIoFuskUMz6L3TJJljzXNosc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kZIPcXx8PEpb07iVhrC8fJgVo2NjcWonii9+VXL0UrWER3oun8yzBbk2vgNNmCx6C4cPRC4MIWLPMsN0totSwz04g4ve3VcquRa3kfClSH5BaNuby22g3mIf85Cml+JZd40y0ABYs3uZnzAF0czPIfVwPjGhy34aWSZ8NdCzRKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NC0iSMiR; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NC0iSMiR"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so43942735e9.1
        for <loongarch@lists.linux.dev>; Tue, 18 Aug 2026 04:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787054335; x=1787659135; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bP85D3OmgxN7hDQ/WBox4fmJQt7qI0HEkQthONdkZ30=;
        b=NC0iSMiRYpXfYZciQ52kV5RCmIH8fmvtigCp4pOLpu1UJlfIZUIm0GbZ8acN72vqdu
         3GCiqXfg8I3qFMY4BitKOUJearVEBtuiSzeky9TswW9OubLEJvWctU2rpXQy3GOkZADP
         uZv4GAsPwdSAwqAAh8XA5p+oceO5zsytIE9Uf+tzrm0Z+z0gy3C8A0wNpmtqT3xcBDbv
         o3TYYOEP3FLzem6Q/FmZ6eivBgyDRdKSaBCNXRKQGaXe4j8IKGF+Qx0WWlYJ+NgUCBjK
         8U/J+GarDyGMlHJyLC/yhJmDjOrjDqjT43ws/fV0/4B/Ctq001/vxGQQfVWs10qy4t5f
         ShPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787054335; x=1787659135;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bP85D3OmgxN7hDQ/WBox4fmJQt7qI0HEkQthONdkZ30=;
        b=oTkDSAu1S2EDOJu9Yj1rKCXUOdEsvs9XkutQw09pJpLxgCyps9B7LdNIOFg7iNtJ32
         xhK70fkwqzSmKxJsfw2MTjlaFRuU2OqRt8ZqgEIZRbdu530egw+Lc6TmxhifqDMn6ogQ
         ZqyFXWY+z932Unw7m2BwQIoBEATXenZSD66R8wD/krr2JQB/5czstNn1hCMS3c3UKhAB
         l5uorLbmryQg5XhqKVilU9XMiVuXyu4dBEVFUtNPQ8M9vbqj1UiVHKE0kycA1fahvKT4
         aH1LtrAK3100hR3ONpaQmI05zBCeOIndea3CehtfkCIiu+rTDBsTyhs/F0t09SpQCK0b
         dQtg==
X-Forwarded-Encrypted: i=1; AHgh+Rpm0DkAbYQI2bM1p+jBNoXS3TZv6FuXsgslLAR+RNiHJtIP2oRBntwj5F0S1sjmBz2J0PKu/kPnMS0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4rcVaMCYTLaLGThPlP5iKeE+roUaU7CmDiLeP44+YUMccIcBk
	EHCmPJaAzc7YQuSdId3NCPEQ1jn9M8mZWhglLLsy6LMCGbohVhNZTyr6FQxotrBDcBQ=
X-Gm-Gg: AR+sD10YgAFTmPEgVa1l35vwl1pqoeMADg1iIEtnDrYa0VUYyG0hWQCYxHaSoT5+zUD
	WP0dUudbmploPt5owKlCAcxOLxwIdZg2mdqOQIL2G8/LWFfLclj1g2ltMJrpiBzTmqT0uax2Fa8
	a6CJCvq0WQ4AXLDGnALr9FjtUyMU6AFbtNuhs9zTGr0hIIiLvCH7ykhy56JtIcj4rd8d3FEPhhc
	b0Lvx/Jm9MFfOcz8+Q3qd4rzuiPGwxasBszRzWlJ+BGxUxZDlMJSYmKMHoHNmmZTJ3uqsV6Ho5m
	WDmLCtw9hzk0+tQedXIa8c45gPKGfOPiRd9fn+wYFo1wstp8Fki6R6mElOr5b5we3VtoUoioHdg
	aPsE6n4sgNOJV3210K67FrPJ59Hf1ciJvf4XhfPRtakGZk7h/wcOS0Ii8SbMy3JLbCiCY/Dpc7A
	jGmKcU+ELXmGxJj7j9OLQzugUGcG84Oes08l97NwalL5yW43IgDKYbsRgweWRP9kuShOtcbc2cO
	x4luOj4acAlcH3Nu8S6dhR9
X-Received: by 2002:a05:600c:4e56:b0:499:a69d:e14b with SMTP id 5b1f17b1804b1-499a69de2fbmr38435355e9.4.1787054335163;
        Tue, 18 Aug 2026 04:58:55 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b7834dsm11494313f8f.28.2026.08.18.04.58.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 04:58:54 -0700 (PDT)
Message-ID: <674042ea-243c-48f5-8010-9181f3e99f06@suse.com>
Date: Tue, 18 Aug 2026 13:58:54 +0200
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] module/kallsyms: Refactor current symbol filtering
 into is_kept_symbol()
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 linux-modules@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260812032807.15034-1-yangtiezhu@loongson.cn>
 <20260812032807.15034-3-yangtiezhu@loongson.cn>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260812032807.15034-3-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/12/26 5:28 AM, Tiezhu Yang wrote:
> Currently, the loops in layout_symtab() and add_kallsyms() duplicate the
> exact same checks (i == 0 || is_livepatch_module() || is_core_symbol())
> to determine whether a symbol should be preserved in the module's core
> symbol table.
> 
> Rename is_core_symbol() to is_kept_symbol() and move the entire checking
> logic inside it, including the special handlers for the first symbol and
> livepatch modules.
> 
> No functional change.
> 
> Suggested-by: Petr Pavlu <petr.pavlu@suse.com>
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

Looks ok to me. I'm also fine also keeping the current name,
is_core_symbol(), as Huacai mentions in his review [1]. I previously
suggested is_kept_symbol() [2], since the is_livepatch_module() check
is moved into this function. However, is_core_symbol() is still ok, as
it is consistent with where the symbols are assigned, in
module::core_kallsyms.

The important part is to avoid duplicating the checks that determine
whether a symbol should be kept in layout_symtab() and add_kallsyms().

Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>

[1] https://lore.kernel.org/linux-modules/CAAhV-H5w8VVW_L6cRes-syjEvhbWmevSKWrZWPFapRkuemmjaw@mail.gmail.com/
[2] https://lore.kernel.org/linux-modules/39a48465-22b6-4b18-9f7e-ce258513181b@suse.com/

-- 
Thanks,
Petr
