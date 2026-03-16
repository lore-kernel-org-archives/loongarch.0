Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8783FF1
	for <loongarch@lists.linux.dev>; Mon, 16 Mar 2026 13:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773666294; cv=none; b=tZzpw+t4CujWDczWobvAiy2qmryCnlXI7mjP8lGbmseGiw3z1HpLlOelybH4xPrRoKM/CA7kaUEhOAqf/CkiBmgI2dvUCmZpk28TC1R/sZfKOfz/G/uM6fKsG91cMxppfStwpg1bZzSOMpYz5Tb7bDG1RknwNdlJSDm11nHKA6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773666294; c=relaxed/simple;
	bh=coROkVKO2LP6M4Zm/yvO7bdjOMBXJEvIaFPryU8r1zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pt31NiuzBeyfIbAs5OMsc0qlKZ0iAdDUlxyBlgGWJUvAHLRSOnapbFlpqVoNXePoaJyKZoKNHl7mt6154sNpxBTS4iDxMFlM57wisP7bs+psSz/aLkkKKU+T3hARDdnKeoGE6+wgB1YGbwc+MVbaPf7UODACpiyHlX9+N2eiQnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ctw6mwgx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ctw6mwgx"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-483487335c2so43983585e9.2
        for <loongarch@lists.linux.dev>; Mon, 16 Mar 2026 06:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773666291; x=1774271091; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WuEn7ehp2dcDf/0JXcNA12V/0d3/A/jz0zpMPpL9KQE=;
        b=Ctw6mwgxUGeH1ih7UstQx71O7ATNhsily8P6YyWm12xvOLj9opnCp9dOMFzopjVdM5
         oMYCuoxeRX2RfHuaavIUejeficmedpg/V4PqGCCwMIBLFspC8EqhVhc97N6IuPgk2FUD
         Spc/jn2jnj4oQUKR6HAzheBaV2Yw9XXUI2xyVpjgXvnj2mh05KsQhuP7+M4MWGb7fXmv
         J7ON0hLaw/+xXuksfBssymUKSjJ2vZuoh8RxyePLE7gKwCaqLJP9haMgZL4LLPaWvNfV
         WSKhejwYliE24faWHtaUN0FTyspOp74MZ/yWkcIIiJo9K2tS3XTeKfjvfF54VckQ/j7q
         IL6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773666291; x=1774271091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuEn7ehp2dcDf/0JXcNA12V/0d3/A/jz0zpMPpL9KQE=;
        b=WLpULwFl5+uX98WSYhAje16cHYHKXoz5Nn4lTaiBYKp7jKlVwewoV1jofOUWGnSs2z
         nW0W2skUiKr3iJ/IbkMcCjdYzwPz2zHGYUADoL6vJA1Spsd29ZTITmoHRq7U6t9IoC+J
         UqxFLpxfNfhe6rEE/YCiP+EU3fFyBxFAQA/QKlD2vC0omr4otpFU+jwaKwmNUCUf0etD
         /M6UJ1mzo6ku2W5TmifXsKvwLnTPtO1JDro/mpcEP6uLWb9GBbGbYEyVYY0fmkDnEYXS
         f66/3UIqYfaAyaPn/HcaQ3QI8qISzavCbD0oIuY+wch5msT6ucHbfv0acjmaRnalw0YN
         WckQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO/pJMGqm2h4y6lAdnqg66GdtVOAxXGmcE4jG5ojNN1PWJb/BAqW69l4dzy9NFt/MmylZltELzcW8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf8luoWJzjBNZzyzJdp3IijyldraDbSM/RLi9RgSLmsoeJvhRR
	3wB8EOpo9cV89XBqb90E3pSd+V/VAOrbi069xp+6T+9s6OT/RbE11Vj1
X-Gm-Gg: ATEYQzyUwGrUePmwXnBTDTa9Ardw9V8oYlTBSAArmODE1hcE3lunccrNmzpH1F4EOCV
	v/01VqKzOrzcNp4lMRBdl54YxOVgh4SkgKYjt8RwV44PAsBbd6q3D/hftYD+dh0EpPaHGjUKYO+
	CtYSVBSkVjIdkK07JnGUeqvtEz6KZDIO77lkUdma3c1AzpefWrHApxtHhsObRcHmFeuNKLRi/wt
	iUZsKjIENWYGTcdiK7kSTB5nKRxt/G7DTgQdU1YDfmn7clFIKY5HQz4ynQ7NafL2/OgejrVvVew
	BVBQ9NVOebzjI1t5Jb5ckbcKOpHH58guNsur9ErJcJ8M5LMKpUs99XLgEaWg7wwHZCIjjzT0But
	nmC0G6xOU3TeC0YX+AQ/C7aOICKYtLol+lycI35vR9L0nxjgn+mJQQLp9Q4yM0C/JvAVIQKRk0n
	Sjp/+3t00ENPwF5xEQEPRyKbDSFH5GVaIuimjFsNM7cf8LFneN6vHempuSu5pMTvcv3zCIxwQkE
	T+YNigJ/qvZGeKv9bUh5I7H503Ti7QslTqp+LdSYeygg+gd192qWI7BBTnuZOuQucMEpBKNcQW4
	DUb69pkScVo=
X-Received: by 2002:a05:600c:8488:b0:485:3f1c:d897 with SMTP id 5b1f17b1804b1-485566d2fdcmr203737915e9.9.1773666291248;
        Mon, 16 Mar 2026 06:04:51 -0700 (PDT)
Received: from mail.gmail.com (2a01cb0889497e0077fb9a9968087a66.ipv6.abo.wanadoo.fr. [2a01:cb08:8949:7e00:77fb:9a99:6808:7a66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485564043a2sm130013895e9.2.2026.03.16.06.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 06:04:50 -0700 (PDT)
Date: Mon, 16 Mar 2026 14:04:48 +0100
From: Paul Chaignon <paul.chaignon@gmail.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Emil Tsalapatis <emil@etsalapatis.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>, loongarch@lists.linux.dev,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v1 1/2] selftests/bpf: Check alignment flag if
 expected result is REJECT
Message-ID: <abf_8FcnQr50CCTn@mail.gmail.com>
References: <20260310064507.4228-1-yangtiezhu@loongson.cn>
 <20260310064507.4228-2-yangtiezhu@loongson.cn>
 <DH02R7I6EAUH.16649BMB7V1N8@etsalapatis.com>
 <fe04d981-fc83-0ba6-4dee-8fc0c953e09f@loongson.cn>
 <abKHi9Pr5iUbIQZI@mail.gmail.com>
 <7ea56716-fd5f-1740-e634-1dec4196dd2c@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ea56716-fd5f-1740-e634-1dec4196dd2c@loongson.cn>

On Thu, Mar 12, 2026 at 07:06:38PM +0800, Tiezhu Yang wrote:
> On 03/12/2026 05:29 PM, Paul Chaignon wrote:
> > On Thu, Mar 12, 2026 at 02:59:57PM +0800, Tiezhu Yang wrote:

[...]

> > > -#14/p Dest pointer in r0 - succeed, check 5 OK
> > > +#14/p Dest pointer in r0 - succeed, check 5 OK (NOTE: not executed due to
> > > unknown alignment)
> > 
> > As stated in my previous answer, this note would be incorrect: the
> > program was executed in test case #14 because it was rejected, not
> > because of unknown alignment.
> 
> OK, please ignore this patch.

I think the second patch in this set is still worthwhile, so maybe
resend it on its own?

Paul

> 
> Thanks,
> Tiezhu
> 
