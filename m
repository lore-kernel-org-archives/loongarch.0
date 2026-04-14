Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074201A239A
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 01:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776129511; cv=pass; b=rxPZW70uxh1HEjrVqMEjCphRJSOfhwFPYVeAtdTKVwwuhDW3EPozOSsm+fCyRrDt0Xo7TMYgXoyi++3/fksapMg1pGRjsIFucvGzrXv0FLIEfObDFEy+4xSw9K9dV+6X3GJt7s/jspPgODN34996L3Rd8NaG1vt2mp6RgctkHhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776129511; c=relaxed/simple;
	bh=r/B5FgrGRLGNvREPhROVObKT+v+R2oXtyEIRxZ/urog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQ1om2I7fiFQnQWW6T/24z7Dik427l1Xoa9J9aHfrM5i1Qs4urRCeA4jfHeW+fgfvLyI/h+VSUC2AIs2Og0xldo1t2RHcDaGikSEu/81Sk0zic7rSbH9ZkLNnrjSJBtdUp0R0242jD0jDDr7g98XKBMkE/cWSbi0Gy0Wdf8pUdQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=dQ+CPVzF; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="dQ+CPVzF"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79ab3e26cceso48022467b3.3
        for <loongarch@lists.linux.dev>; Mon, 13 Apr 2026 18:18:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776129509; cv=none;
        d=google.com; s=arc-20240605;
        b=TC+OZ8c9mMIkgdW8SWy5rH9wIBkkEPhXrVkW6rjSkYTvw0lxd6o+KLUNAJYc0RyUIt
         oPIHovJ6MjPJt2X+XC6szgyEHu3ZCRrWpqzgcEbfMqULlcIzeg0IiXnOw1MXV/A4rv+8
         Icww9v/RdDft6Xske4HHmPLYVQVXT7kZyEa2tUXkLqh7GcOU1bWuA3SO/hG9PyBVDRrz
         vH/BgeleJYORIU8bVO3f8t2dEhFkZJPFHN2qpMS3rlFuuO3cpB8OuyhLkh+E/5Z2qc72
         LlV8y3DNKu52B8NOD1OPv6LboHsOvHkBdwevxXMxZJ3HQ+JOa2V0H1i5F90lEpW3fR5o
         Wqbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IrEpUWhdq/JQ2fIqYqebNC4R+txxo9jSE1dyCgQYRdI=;
        fh=OXcRLpGg3OLTPakgA+G2zbWg1KoKCTaPQd7tgQL+9V8=;
        b=al//ujygFDhBtieV6AR77WnL4lPw4KzsouSpaT+kylvolbLD7rO2EOlkSr4+xehd9G
         zveVVgwUWoj0oe5ygzqK/kgBeZubuupumJMufPLhlw3k2OmLuU7atZ9kOql8dVeEpszy
         TvOrNv8whBk2bYG7XrmC5/ZwvFtsG7DlkNT5is2iK0AC/7kdRNHfh+/mi0ZfapsPWWV8
         DkhQG14rp8D2mtPd4pPlynwhXF32ymLwp1thFSQx8Y0PO0cMnJ75BiFj/bze74KuFisl
         pXpcgA9rreeBZeFcDUaKZsovqiFL5Von3y1KmpqznEaVp7fUuza8im+F/OvayyE1A4Cm
         /urg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1776129509; x=1776734309; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IrEpUWhdq/JQ2fIqYqebNC4R+txxo9jSE1dyCgQYRdI=;
        b=dQ+CPVzFINiK2VjjBz6X0GnhPlggARTexIb/2/WeeiPlSZTNRiW4Fx+2hHKzYz+Y4J
         5Vvl0MdHAOvlZpHMgoBTmp8uDLmzGQJzCmmlGJTSaHN1m2GvR7PdwZe4PNRDQVqqzhuQ
         8z9vCCrBxgQvXCtv+z2+kB9L0V8BEaqLJhxDoe3Fq7HiH3cjGMtrTW3sjF7p2MnfzBig
         CI5uHnaWDOZW7/TuoKkX6USiIrgc4UGMS+T/5jiuE5L8ZrLmLtLbnydumEhi/BTzslZK
         7Xz6y0dL2tMs6TFHKKc7mTFrmaA6bFUAuajfteovVrViDJvBFMbJ/5/DWr7c/Xn8wAf5
         ZERg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776129509; x=1776734309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IrEpUWhdq/JQ2fIqYqebNC4R+txxo9jSE1dyCgQYRdI=;
        b=qwGX9ZWzF7sLvO/NhCzZtm9AYv2uqB2RvZi/A18i+VlK65MKZk5a2dDPtqc1orjci3
         rrW7o/dQ1uv+zoe/byWdSTdSWRZSPcAhtUzaVtuhJyq17XZJ04axhOReXEaqlYtxXVGn
         /XrPGEdSs3RBC0+uReA7kNfphvpJ25zq/WbXGhoNV8yvcBQdEtqZDoW0SIj3NkDNmOwQ
         YhVZFRgrSUBSnONMkNG/uwFvLJ5KB6DBHwLo0xQwTsbXaRc2exy4OUukfvoraCVKf798
         6gHshbiYIMKlc4RV3eMo9xTMvD/7NLVCP7A/cvSVtXjylMW9Xe5Aj4xd1BWfEMIC/lLi
         We2A==
X-Forwarded-Encrypted: i=1; AFNElJ+ThuEZc3uXkzuyNbcDLKhCq6YyZ6Tjl4jSGElXAQKhWNP1+5ZtMVKub8wg++I69ZTLZH+lRTRNxrM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3IWoxk3SfiofEUa1n8vOP92aD6VMiriYcektLkVSbWF8P9tpR
	PiDHuP/N14+2k3yapTcNMy7grvkSWaeeCoAm8yqvqwsNUpkFCJ67RVNqjm8/P6AL/3FU8n5eY7e
	3eyVEEgB6E5kVrG+pkbOW0hMdoRWL2UqbVEAGt1qWQA==
X-Gm-Gg: AeBDievD677PCk1MdodoAAiWvG6Jz768VED29/CxLwDdm72yjjEYeq3WQAvebmMzvRO
	27iAlWg4KNuXsREUhpA6wW3LJcg5xGlPxG48LzLfnjJ+UT8+9OGIlE8b1yw1LUKld3rTEV1clcM
	K3ECGcd6LpC9+9QZ3UKahrwgCCQnajCGvtjmVozotzsfOhR331xo8RNsuS72aKKt6xaQTuEIs0a
	RTrrRgzi+N4AJ7elTpu8yLs+q6UdJ1kFkMqwQR4uXSIvv+aNgoUP7MaqKcxuRPUEYI97buczQ5D
	pop/uu9/T92Df+FM6M6Z30W1XU05Tr/+jKBe4f6TGVmQN0HZqh0=
X-Received: by 2002:a53:b198:0:b0:64a:f163:1554 with SMTP id
 956f58d0204a3-65198a6cf59mr11028006d50.14.1776129508992; Mon, 13 Apr 2026
 18:18:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260414005152.10550-1-r@hev.cc> <CANVb8WZXZj1Yqd7foqHBLSHjO73r0Kg62bMbrb--aE8wR3G2hg@mail.gmail.com>
In-Reply-To: <CANVb8WZXZj1Yqd7foqHBLSHjO73r0Kg62bMbrb--aE8wR3G2hg@mail.gmail.com>
From: hev <r@hev.cc>
Date: Tue, 14 Apr 2026 09:18:18 +0800
X-Gm-Features: AQROBzDXHKcDiM7ytv6ZGBgkaWU-pXvKEfBok_mK6DXk_L-fF_PJq41YLK00YQM
Message-ID: <CAHirt9jA3G5kRjJbmosttEDkvZhKfx3U6oa63JZOnpEx4Cqb2g@mail.gmail.com>
Subject: Re: [PATCH] perf loongarch: Fix build failure with CONFIG_LIBDW_DWARF_UNWIND
To: jiny L <leeavianna3@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 9:13=E2=80=AFAM jiny L <leeavianna3@gmail.com> wrot=
e:
>
>
>
> On Mon, Apr 13, 2026 at 5:52=E2=80=AFPM WANG Rui <r@hev.cc> wrote:
>>
>> Building perf for LoongArch fails when CONFIG_LIBDW_DWARF_UNWIND is
>> enabled because unwind-libdw.o is still referenced in
>> arch/loongarch/util/Build.
>>
>> Fixes: e62fae9d9e8 ("perf unwind-libdw: Fix a cross-arch unwinding bug")
>> Signed-off-by: WANG Rui <r@hev.cc>
>> ---
>>  tools/perf/arch/loongarch/util/Build | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/tools/perf/arch/loongarch/util/Build b/tools/perf/arch/loon=
garch/util/Build
>> index 3ad73d0289f3..8d91e78d31c9 100644
>> --- a/tools/perf/arch/loongarch/util/Build
>> +++ b/tools/perf/arch/loongarch/util/Build
>> @@ -1,4 +1,3 @@
>>  perf-util-y +=3D header.o
>>
>>  perf-util-$(CONFIG_LOCAL_LIBUNWIND) +=3D unwind-libunwind.o
>> -perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) +=3D unwind-libdw.o
>> --
>> 2.53.0
>>
>>
>
> I happened to have the same build issue on linux 7.0 and I found there is=
 already a patch fixing this  https://lore.kernel.org/lkml/20260413024805.1=
316480-3-irogers@google.com/

Thanks for the reference.
Rui
