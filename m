Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4703DBD51
	for <loongarch@lists.linux.dev>; Tue, 29 Sep 2026 08:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790670220; cv=pass; b=cmRvuwSvJTYgkyp7pp06zJRFyPZB9oJdR4oIBC6ja9xga4LypCcHmifW7s0E2H42mUL8Fzo130HRR7UtKdkPcKjbLxG3OGfxjLv8+diMqVT7eTUXjRX6uaDwWyMqTNn56XxjNEsLSpx6ibG5OkYcUovN0Nhr2LoVgpWwGsv3KcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790670220; c=relaxed/simple;
	bh=Bk+aDP7Fo6BLFnfF0mkl/u5hMpwIT56K5DBxKBjeA+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qaNmd5XKKhRrTcdgUqmS4i2jCQC4Qf/p8nDyc3b+TiJjrlPeyTIMsOs0wEWfL5gRv4bNXkUXX4fDBAyevnIgKzcFDbdrV1A0q0IKXWTf0oL09Xt1RYn81S4uL0jFheYlMv6qF1EhaQn1EMoj8hkx+nGi7Per/86nsxoNndVfGLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRqAsnr6; arc=pass smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRqAsnr6"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2dbbf409b8so372668066b.3
        for <loongarch@lists.linux.dev>; Tue, 29 Sep 2026 01:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790670217; cv=none;
        d=google.com; s=arc-20260327;
        b=dAykXekxL4pZqkOSZcGyqHda+OQ2KDJUDG6tZZrmsJ99DaxlAa8Z3CoGStJMOaj8pn
         /7spR0yJGw/X1akm1fiQraYxS/Vw7U9fshTE+sLdpsLwGxwBz2zkesuuiqEmEPKbSLOC
         vQ/4Lv61O3zBN7kmrJnpqBVtu1+YmVeJ//JCYt9FE+1Sok/K2i/m6J4yMzxBjexsIYE8
         tfXOUv5co4J+0+xkDUPUgh3xSNM4JsVAHFeFyhbVdshIzCPCpZnqFr+MRn8tJWVKz8XU
         XlNLqX8YWigLTENBpKpoHWOAJuVJZ2abVaBDxnrQxM7YoGgvbbyvM+XR2rn6E9ekuvHq
         ZQgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QsSsp02Bm0lwSm0F+9L2uo07sOJ8G2AE2hjXwr01EUg=;
        fh=rqdhvkDqAOwY8rDEk2QeQG+/Xy1jHnVezc2iUbrEh+w=;
        b=DNHE6iakXjjxAwnprjxJe3RMz5aPHm8kS8LhMY45gmQBCH0VFKLRhzfHfqg7ViGSry
         wUoTzTiCkjgfYH5foH7PXThq4jKOT7tn7wK3pHfyFzKTEXQF0Lb6B4x3Dl5ebUKX7Jm9
         0h1f0z5+1d5rVU9OrKIgNAOIl1aZmDFl589a7G36m4lnvGkwSvu5k3paJM9wi0znr59S
         QhmVoXV2IwjT5cbrB3ElV0QY7KwinyQt1U4GOhHkJIombDXekbbIgpYLKcldXhTo4WXq
         IaVIW9ebI+iNCmDjwwiH6k9qA6iq5M/wr2VxJa1MzfagcF6yTRRMBUcLoBjmu/rsPZf3
         +Nrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790670217; x=1791275017; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QsSsp02Bm0lwSm0F+9L2uo07sOJ8G2AE2hjXwr01EUg=;
        b=dRqAsnr6UE0NLSDjU0rr0fbBdp9YsVB0fE30T7Jk2RJffarFGNx3BF6MEO9EpiqLgO
         1SHi+yw9AVi5cI+Ms3p1V24OmRuVgpfmqs+dtYnBGbxT1YqlP7YXhdB0Xn2TdSgbpQG7
         r5+77Lg29YmfYPCcfVwMNim8NSIBDAu2N7OMSovLiNNKzEjAMu9ZqlJUvmItS+jIzkuN
         ql/Z0mEK+O/VU08Be0F9uoiRV0IieS6/ILg8K8KkrM3Wwfzbgr3f36mxo2G9tYM9iLt8
         giFAF1sUlOZuMkwYEu0WBBHkp+1C+YNXcVQuHTvxU6/7L4CYL4hU6KCTcd0+Xl4hTjaE
         jtCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790670217; x=1791275017;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QsSsp02Bm0lwSm0F+9L2uo07sOJ8G2AE2hjXwr01EUg=;
        b=dRk3gyxvKdzP1JB9VMDVI/QV82WVFNPDu7Ihbrl/6J9G2Cb7BzVWmJSi3Wpg6JBXBj
         K7YReTE3kK/Bm0xKK5q3dzpF0nqelq8xmci5x9IO/A2eYsDS7uLvzavUgysfYTLFzvVc
         JmW5jXhOW0+qMWpeRaEel0bepW2LLeTngXYviqqJ2t/Ap39a72ZyE5gAU0ZI3BHpBtZo
         lBNAiEc48jmbZdUP5591XuusQn5DGrdo7FtSSeey7oua8QH6K+biXreKxeaICb2gIv/Q
         HXEbWFD2aZN+kAGB8ix6vMIQnG6MPhuEzUe7xEPBTnyWQHoukTvLAkpDI6FapU0w+DJq
         2TEg==
X-Forwarded-Encrypted: i=1; AKwUvBx8qqGSpM4KzPqFR0x+JTa8UoipO4PazQDELl1QsKLK0qOqirG/HRSD9fVgE7reALKWlmWFTn6MRe0=@lists.linux.dev
X-Gm-Message-State: AFuF++k6io/rFvRzhDG/TqenPOkUY7FC5jzYsJNBkufjTJRfzOYWbmWz
	s0Hi9qSuFupwh5HyxDuKvLYgwPj+K/xNHVQ60yPMajbwewFANvdu9vEyBZ14Qp9guLzcrAdu8DR
	7nVBNiCrsAP/5mm/lQkSjOfpoTYLsSjg=
X-Gm-Gg: AYBFou273WyP6+HVFt3Lk+igKDhh0Inrq6b7jPOfVe4Qulnh9OOcc/gl+cCVsLruQl/
	GRK2Aymw6jnqjXDRFkouFpEJTEaiTydAPv1xbhP3Lj10t8hgyNzOGWJwVcaYBNgS+GnGhIepYJD
	SJ5VwAijRB6rub2/9SVXKYxViCRzldpl7lGKCjpW0j4k3ITJb2dfGw+ebr6u78WtY3O+oi+nHHp
	3sMlMatsPLlKit4LSICPyYMD+pc4kuQqDMg8KsZoXl7JpFz+BQqphvrBA12N5AZE+XgMsvR3yJW
	HlgUd72FRE9dqGJv1V1qsTJU8J4Ru1OAXaVPg3y+EYI/B6H15XKsid3HYg==
X-Received: by 2002:a17:907:7b8c:b0:c2d:c33d:a9cd with SMTP id
 a640c23a62f3a-c2dc33dad54mr618259366b.4.1790670216558; Tue, 29 Sep 2026
 01:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1790561983.git.zhoubinbin@loongson.cn> <502911659e15a51c4e98c11f3cf476dd5f92e75b.1790561983.git.zhoubinbin@loongson.cn>
 <0aaf7166-378c-47d7-98d4-1004fdaeae7b@oss.qualcomm.com> <CAMpQs4+uWMfFib7MhRcc7o-QMXkFrFCtdcGj04y56u44JL4iOg@mail.gmail.com>
 <ed99f62d-cf90-4ba9-89b3-08dbe7f7227e@oss.qualcomm.com> <CAMpQs4+hATFf+0w6Wq09RoZB1JJ5L_GP0aWxcGAeraTW7Gfy0w@mail.gmail.com>
 <8eba263a-c233-42c5-842e-7487ea36d5aa@oss.qualcomm.com>
In-Reply-To: <8eba263a-c233-42c5-842e-7487ea36d5aa@oss.qualcomm.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Tue, 29 Sep 2026 16:23:24 +0800
X-Gm-Features: AclHuK88BsaqlI4K2ocbd-PK2C68a5LcpD95joZ3dWjYgjyNNn2FFfvJo1d4Dpk
Message-ID: <CAMpQs4JvLOUv3o8tktg-EOT85KCunY9gJhgxQVkZEXPH_C+4EQ@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] thermal/drivers/loongson2: Correct thermal sensor
 registration loop
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, stable@vger.kernel.org, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel:

On Tue, Sep 29, 2026 at 1:46=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>
> On 9/29/26 05:06, Binbin Zhou wrote:
> > Hi Daniel:
>
> [ ... ]
>
> >>>> Please make a less cumbersome and implicit checks here. For example
> >>>> count the number of sensors and then do the check against.
> >>>
> >>> I thought about it, and you're right=E2=80=94I made the logic here to=
o complicated.
> >>> Let's use `sensor_count` as the counter. Is the following check logic=
 clearer?
> >>>
> >>>           u32 sensor_count =3D 0;
> >>>
> >>>           for (unsigned int i =3D 0; i <=3D LOONGSON2_MAX_SENSOR_SEL_=
NUM; i++) {
> >>>                   tzd =3D devm_thermal_of_zone_register(dev, i, data,
> >>> data->chip_data->thermal_ops);
> >>>                   if (IS_ERR(tzd)) {
> >>>                           if (PTR_ERR(tzd) =3D=3D -ENODEV)
> >>>                                   continue;
> >>>
> >>>                           return dev_err_probe(dev, PTR_ERR(tzd),
> >>>                                                "failed to register se=
nsor %d", i);
> >>>                   }
> >>>
> >>>                   sensor_count++;
> >>
> >> If I'm not mistaken in the previous version, the loop exits at the fir=
st
> >> registered sensor
> >>
> >>          if (!IS_ERR(tzd))
> >>                  break;
> >>
> >> Here all the available sensors are registered
> >
> > The name `sensor_count` might be a bit misleading, but here the loop
> > exits after the first success:
> >
> >                  sensor_count++;
> >                  break;
> >
> > Let=E2=80=99s rename it:
>
> Can you clarify why only the first sensor found stops the thermal zones
> registration ?

This section of code is based on the original version by zhuyinbo; I
noticed that you=E2=80=99ve had related discussions about it before[1][2].

I=E2=80=99ve reviewed all Loongson-2K CPUs that support thermal monitoring,
and they all have only one temperature sensor, with =E2=80=9CSEL=E2=80=9D s=
et to 0.

As I understand it, given the current situation, the loop here doesn=E2=80=
=99t
seem necessary=E2=80=94physically, there is only one temperature sensor (ev=
en
though its SEL value might theoretically be non-zero).
`LOONGSON2_MAX_SENSOR_SEL_NUM` does not accurately reflect the number
of temperature sensors; it is merely an interrupt input selection, so
using it here does not seem entirely appropriate.

Therefore, I believe treating the Loongson-2K thermal driver as a
single thermal sensor better aligns with the current hardware
behavior.

Just use:
         devm_thermal_of_zone_register(dev, 0, data, thermal_ops);

[1]: https://lore.kernel.org/all/ac5b3982-a658-e05b-1b5c-3aeeda1585ed@loong=
son.cn/
[2]: https://lore.kernel.org/all/8ca44091-35fd-cc24-9896-0317772c5620@loong=
son.cn/

--=20
Thanks.
Binbin
