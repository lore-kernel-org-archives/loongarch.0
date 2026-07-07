Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFE543149C
	for <loongarch@lists.linux.dev>; Tue,  7 Jul 2026 16:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783441922; cv=none; b=QLtRoQ1z0NwrHYDvb9QOKhx9bW9F8O6EeypKQm36b4So46k6E8f7GwCbuKUZqPdmAxgNr+G/3XcuM8u958vqwgudB9msQD+EEIleDD/9V2v/38HScUetZ/radT4wCLnS6xp/Xit7DY2q0MeqB4QM/zAKm8QRH1dg6db6do4epB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783441922; c=relaxed/simple;
	bh=gGzx3dFnivTgZ/tqWbN8NHW7o1lF8IcUldK8xxPVITk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s3Jcw39WDfkdi1gjHMD9+WcxRKHx9/K1tHYzs9YLI8uyXsEnXEa/jCphf7VEDSRSckiA5CbvyaxrRgTJtAHo4gEqBxnnZw9Q05y/tztbO3dUXSTMG7u6bJsn34BErspwehRojJ5i89CQZxOGZdeAWzI8Ju8fy1vxYG6AAbw9wXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s8z8nkb6; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s8z8nkb6"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c998fd549a8so3033271a12.2
        for <loongarch@lists.linux.dev>; Tue, 07 Jul 2026 09:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783441920; x=1784046720; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gGzx3dFnivTgZ/tqWbN8NHW7o1lF8IcUldK8xxPVITk=;
        b=s8z8nkb6UZWlIwQw65jNhZnfku3BiDb3SRuzY4MTmuC9nJn4Jp72p3HHsJ2+vIDz0x
         lzqjjl4cva3cUEKsGUW0l178O65+L4oYwM32D3YPg3HGFEQ8oHkTXPU5x84zic1JoUkE
         SJ3OKsyERUqCoc/iukoH3P1pIdFWBLR8ct/pWJ8MPMySikGRsohrxl2TGQrj2hwtMtUf
         SMWJVffEaTDIGBnkesOfsW3xi5Igmchd6aLvNM7y/xFbqaiTiw5HyIZ5ZU0cG682w/Hf
         ocOZ1nclbTxuEEBGevZdkpbZbEp6eFLZMzhhzrnA8rdAGAK/HI0jxBWrZ9AO/I6m7YJg
         GpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783441920; x=1784046720;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGzx3dFnivTgZ/tqWbN8NHW7o1lF8IcUldK8xxPVITk=;
        b=ci3YAL0jY0iYlKK2Cz4ZRNxPVw+tKWMLynEd46pCU7ViUfKqy6BAOBKC23gOZkZG6L
         agURbvGAHx2cHTc4yGILRFIoWjrHGsCDl39sK/hM3xfAoQ+LIRIsdHcPxc9BoxR48Jao
         00b7RQBFFQATTLbrOKavVyElNfdzMVAHypUHS15G9WzbCmEmNK6BrFpFY83Hr1aQb4bW
         GUkqVmMEn2lk5slX1Z6p8rB433VGfMnNAIDyL/2SbwqB1azD1a+H5ujczI5204VKVQOT
         gCBum/C1p8QX+e/mCSbhFm3Y3erExQfRGTyLUNqDR20Ncpj4fH6E7/CuKto1iUUeNAlE
         uBdg==
X-Forwarded-Encrypted: i=1; AHgh+RohNqnCjCNddRM08HH+Juiz/2xIGGzWB2y8ZBtkMfqAnTnPE3plz58gzmWtUGx1XDlJi0Otyna5Smw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyUyavVYaYP104DKNuroRsEvdzFEfvfrC5SmpDVNJui5ncKhMAW
	kDboX/UOJL7m03YgvBCxkvbl5nktZGEtekWXhSlbRrFLpFeTDityKk7m
X-Gm-Gg: AfdE7clZRJo0qOxb1r1VH+MyBRGdcoefAKV+YV8SFBEId4L9Pc0STQtwMdZUaPZOkg5
	uKgzib2Jh6vsO6sxpVHimzPpT68QwL4uYcwu0JCZMt40M23oGyI6YzBv2dvcxXZ97gHuejvruno
	+X2PpaugteLtmWvsyxR/S4KTHvJIRevjCYFD22t0aiR2PleH8ERU1gYG31ZGN7PFuYyar08vyMR
	bm0cLzpk8wPh3JpsIwu7DyA1lEBkE02p61FeCRpHhCbWwPp6PLkLSTMlPld14PyTRF+d2YOb8Ez
	QykGHRmKm+SkBJuKTQPzfo4GhPezoi64nJb6YU7/c2U/oxF718DGqP/Vn34nCRHY0CNWUYyt4xo
	OgzbHvU21UKSC+jgA29PGHsV4I46nIDSKksUnFeMXXI77oOf3fb53avTP0fVgKXdEwg2kXfx2U4
	cMd+11nWREtWO1TdWVpKOFr3utz+yEBKlz42qwLX2sbeM8KJj8vyN8H1N0CL9eZgqtsgzouw==
X-Received: by 2002:a05:6a20:5491:b0:398:7df5:2dae with SMTP id adf61e73a8af0-3c08ed14361mr7575416637.9.1783441920227;
        Tue, 07 Jul 2026 09:32:00 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:84b0:ae0a:5cbe:26bf? ([2620:10d:c090:500::1:76b9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118389d9bcsm2489902eec.20.2026.07.07.09.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 09:31:59 -0700 (PDT)
Message-ID: <7bc3b23e96b502f9f5aa7012ce1b671b6d29e996.camel@gmail.com>
Subject: Re: [PATCH bpf-next v8 2/2] bpf: Reject programs with inlined
 helpers if JIT is not available
From: Eduard Zingerman <eddyz87@gmail.com>
To: Leon Hwang <leon.hwang@linux.dev>, Tiezhu Yang <yangtiezhu@loongson.cn>,
  Alexei Starovoitov	 <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Andrii Nakryiko	 <andrii@kernel.org>, Kumar
 Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>,  Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis
 <emil@etsalapatis.com>, KaFai Wan <kafai.wan@linux.dev>
Cc: bpf@vger.kernel.org, loongarch@lists.linux.dev, Puranjay Mohan
	 <puranjay@kernel.org>, =?ISO-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Date: Tue, 07 Jul 2026 09:31:57 -0700
In-Reply-To: <7b8e9361-2fc9-4302-b055-3657b19d2272@linux.dev>
References: <20260706040006.10331-1-yangtiezhu@loongson.cn>
	 <20260706040006.10331-3-yangtiezhu@loongson.cn>
	 <abd697d839043d80e0230d2b9ab30b214dfa34d7.camel@gmail.com>
	 <e86ba5c0-41c2-4492-a316-7693c7d8d3fd@linux.dev>
	 <1c1738784ae321ed5c9dfa0aca6d0f483592713f.camel@gmail.com>
	 <7b8e9361-2fc9-4302-b055-3657b19d2272@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-07-07 at 21:42 +0800, Leon Hwang wrote:
> On 2026/7/7 17:27, Eduard Zingerman wrote:

[...]

> > Meaning that you'd prefer the bpf_get_smp_processor_id() and co to
> > work correctly w/o JIT, do I understand you correctly?
> >=20
> Hmm, no. According to Alexei's comment [1], we should reject the helper
> by the way of this patch.
>=20
> [1] https://lore.kernel.org/bpf/DJN001X0S57Y.18CKUS4NDDQT1@gmail.com/

Ok, good, the sooner the better. Thank you.
