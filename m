Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7803CC330
	for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 09:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787219624; cv=none; b=jA3i5uXQtYZxEymcG5Xk9dFPcTMbOysQbf3S3J4SnJYrXnj3w1+32b91CItvymnS0dMznV3ISRn3QZ8QHs7bf7XTjkbXafgY9LWOqamvFFHTMrdTcm5ebpKT47Poe1cYXD1X+Hlgnrl8Nwssndq7patCl7WgHbGBEQu3W32FTP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787219624; c=relaxed/simple;
	bh=ej6Va93k+afyPpSdoRsXCwDTyq75PwwJMrXamE+Nyss=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rAB17Jtp1IemLjj0w2WfjVvDKo+/lsjlAtRl0bSE1DjYZIj0gB8x4QKB+yMhDxM739WFftyvaNW64/66X2glxZs03+8rurvSQzY+M0G0RsdIXk+9QVyNdRtpT35ZDZy0ReGcqhR87bNLX1g9ZFJAtdjCIHi3hTVPxpM1Sqc0Jmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DJEtUIaI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DJEtUIaI"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so18883125e9.1
        for <loongarch@lists.linux.dev>; Thu, 20 Aug 2026 02:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787219619; x=1787824419; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wP66327MWS8VhJp48Lj+aYSlLX7zAuS97DNshIbvPkQ=;
        b=DJEtUIaIsOVRqwyg6QwNTOl55uCfEeJCnYCT1hUF+N1hv//UGnz1u6DEQzTow+OQqf
         2tdkqPyZHLWXV6+DWhI+wvVvu+dw8bk7ADvySkGTEKUYtciv4cU9JhycNzikgJhN0ZjT
         BvMdr00QY7Sa7bYHZidqsZUasPVcD2NVFAxFNgrwC/J+Eioshv2XEARg3++pV5fIQD4n
         RSBGGnIGRjedRbTamh6hbsRxqtty72+Gc9ZmAggDe9P7Tv2CiV237hqEkbozp1262FPN
         BUERyyhTgjnbST3XpEDMZS8I8YgqS12CSdQWl3Udtp5dbQwSAysqgaWnzBPTUTfHBMrn
         cMRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787219619; x=1787824419;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wP66327MWS8VhJp48Lj+aYSlLX7zAuS97DNshIbvPkQ=;
        b=mVYaBp6n7N3nyqjxRuubZ+18/naCiJXkSthY5oc7CWfrVi7Ey0UUvLqWFEQ1JMppJl
         w6ygMWkdDPynRqG/RlDcvKs5QlZRAHZtW4vwdIR304WaTKZWKwOhYhqYGa02m7nxzRdq
         MARQl79kZwGz6kMZAzlQnZIgGSjpL+ZKpycpaqq/0x1N5grq5vYdupMTJxAxafu7qFQ1
         qBFTcVDErAp9K6YS2Ycno5fX+gVrNE+smIlv3qaLox8J17DR8BL1znzHxCOUOxByUXUs
         8Wy8hj08XBgRTVgrR6B/ty/hrR4GJ7prhVwQ+bz8U2hFSYk4U5V3INi0+8sKOH8twafr
         Wn0A==
X-Forwarded-Encrypted: i=1; AHgh+RrRrXDKHzEbgq+GMMan5hLcuaK8VrLKUM1hSmDk6gUpIaquVKsDv7lW0gtaQjocPf9l3XVjPwdRSBg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzsjd+6PyJTf3Y1pO2LM+N/aZ/oYIxFQPGstnUs09P1gP+xnQt9
	LlAlThVrqaGq2RTP1v6lUlJZcceSjg6nLVPoYYQ5az8pvYFyvunzVt+7E38IuKOyFlHQ6rg30nZ
	ED97svrk=
X-Gm-Gg: AR+sD1246qjuajYAjFmJcwXKndG7qqfI4jfuqlTBbApm0f+j1SLzgCG+npglOmbXSD6
	QE7g7RZe1YdWN3VObHcoy4TVueKO3QsBxfZGS5wkNC2fqR8zZOsWrH6f+24eyiOOHOMQD8kN19E
	aWB+eDa8AiFroMPLw+d9SX9ejTZo78sb2D1uF1pu0eplVV0Gkwb8cRP0jl0cihEiTHWPlgTpmy3
	KcNWUf4zEwS2txiB5hygwpJhYj96qmlkcZPyJwRYdYab0MBquFsDgcSxL8++pu8W8uLEih3AfqS
	G4AZWBHgZqWhJ02VbmxGfCOkHDdSbejyTz/RoFHshP4FnZlGyGasVSCWnN70n3jG9tBgOMLIrMb
	SmVsjQ7ti72V8DNd3bBxqoC2I+BFxNv9wTk2Gj+5HaZZfbb+dqfL67WIiXbyNOwKUE8x2tgJtdb
	7RFHs/P+bN2VYWAxsjoTAskSNlhFoEqC58CQfefV5emvgHMPXjCjAEFzhFeiReob2SAhUTdKn2U
	bdKoly+PXtjDGlmiD5najNMIEsKybNZG0o=
X-Received: by 2002:a05:600c:6211:b0:499:a760:722f with SMTP id 5b1f17b1804b1-499aa1ba0b7mr207185505e9.13.1787219619110;
        Thu, 20 Aug 2026 02:53:39 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b20bb2b4sm33083495e9.0.2026.08.20.02.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2026 02:53:38 -0700 (PDT)
Message-ID: <226fd868-b51d-4ec4-b13f-520ccd0e8e36@suse.com>
Date: Thu, 20 Aug 2026 11:53:37 +0200
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
 <96b0e23b-165d-4026-bdfe-f8cd8ceb36ba@suse.com>
 <d22a5f25-b4b3-faa4-46d5-132f3fa725f3@loongson.cn>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <d22a5f25-b4b3-faa4-46d5-132f3fa725f3@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 8/18/26 3:04 PM, Tiezhu Yang wrote:
> On 2026/8/18 下午7:56, Petr Pavlu wrote:
>> Another comment-only reference to is_mapping_symbol() that should be
>> updated is in tools/perf/util/symbol.h.
> 
> There may be conflicts between modules-next and perf-tools-next:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/modules/linux.git/log/tools/perf/util/symbol.h?h=modules-next
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/log/tools/perf/util/symbol.h?h=perf-tools-next
> 
> So one way is to not modify tools/perf/util/symbol.h if based
> on modules-next at this time, the other way is to rebase the
> code and then send the series after the merge window.
> 
> Please let me know what is the proper way.

I don't immediately see that updating the comment in
tools/perf/util/symbol.h would cause a conflict with either modules-next
or perf-tools-next.

I think you can even base the series on mainline. It applies cleanly
to v7.2. If there happens to be a conflict, it should be minor and I can
deal with it.

Importantly, please Cc the maintainers of the updated non-module files
(scripts/faddr2line, scripts/mod/modpost.h, tools/perf/util/symbol.h) in
the next version of this patch so they are aware of the change.

-- 
Thanks,
Petr
