Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F78371EA5
	for <loongarch@lists.linux.dev>; Tue, 26 Aug 2025 18:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756234145; cv=none; b=IFIQEie+LxZNbKtQ/5+7Hfdab+1mUgTxqqpF9gtNGFc8EwhPw3mZC0T2t/lqB7EXk//vIf4DCy/CrAEZ0Y5l1JEBWAPyXDm8qNz8o3Oxn1EbDsRIQd7h4Ka+/MIdwjTl6nbTnNjm3Hqj5jVbhNOPrbrHfSBRKch4BHHdaaNkuY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756234145; c=relaxed/simple;
	bh=E/Ye7/SL7tqTx9oBx/tviBmGnvw5YMp+2zk7nWejWf0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l5+uzjC107TIcp4dVqrsXGpLIGTeFrl3KaLOL8IfqVFfBF6pOVjDYQNAnmVxqvbuRpVL2cL0soXuXhTsLaBebCPWHNIKC67PUOZtHfFsP+kSZbnSAA/hEeKGLunu94E7fMXkf2FBlauGmSYhk9GmSPDmso64eIMe/+KZiB6Tb3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TV5Fg5nV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TV5Fg5nV"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-24611734e50so26075ad.1
        for <loongarch@lists.linux.dev>; Tue, 26 Aug 2025 11:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756234141; x=1756838941; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/Ye7/SL7tqTx9oBx/tviBmGnvw5YMp+2zk7nWejWf0=;
        b=TV5Fg5nVrcQDPq0DSXpAWiJ3DPBc6PyEI1YENgFhWDYdrVAaQ5Kg+IYQUHU8Gtpdsx
         GxooIG7TYX0GzVONn3EO5NpBFA38Mo3YtsfzVgFCIEyA+GlUbJK0+KicL5losh3TFh2d
         9z+SqFNnZ+3z0lTv/x2erwDH0cMpP/Ky6KbHq/22qCUxRajlZYOJaKMFn/rumoGdEjoE
         kdS+kQdkDbcX5tdie7guOZYOcxPeZ0QtMv+NjEh20lDaPJzV9GnZZmnE9C1xXzuO0Rr1
         G67GDFpyzEitc5ZdfEZb3mvtYKgn0RZnrMN8L0Gq5OmI6fP152dLMXunp84fbobtn3KO
         zXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756234141; x=1756838941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E/Ye7/SL7tqTx9oBx/tviBmGnvw5YMp+2zk7nWejWf0=;
        b=dSYkkXpDckHtH1SLEtCFOksUHHlNwh336m+qReQm161D1lbvarl8ReeqYmRYZV+TcG
         l0YFL/WhRvRlzLuNGAlUt66DNpaxZ6XGufghbhBwuIvNdIbgrI1yM4/zYL5KAs9Hf2bn
         vCz0SAOKVVNJc9asWx40VYLGVu6tD1tkEPaSU7ak1sfd7GchAKKAsMMGNgSkn9xTq60r
         OqRh4fR5wyVdP7EqLgGEwDHsNUSdBRPaC0H3Rx07VYSF448pBHkVtFWSiDxeAO8KbOwv
         RgdyXDY7ZpouiIZVMyXA9tHbHUOGjqj6opJEQPvwlxos1qPHZhkNviVDrcaxypft4QuN
         Xm/g==
X-Forwarded-Encrypted: i=1; AJvYcCUJe9OCy3QqXOYZSIOUlDBdZuCw3mRQN3/cS8k7FhdRwIPqA1YnjZOKiveGA3g3P/2YB8dJoJP7TXU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzncSJU1xQPkR5upqA+9GXWavSm7EL2Gw7aXhaXkizPEg4jv0zi
	efxPHiHjpTNyb31Qly53eCd9m3tfRdcxeSNUUl/MdHjArEnYTsf0/qAaNXTIc+/2r6ag6UBxn+c
	AWPUJS8EZWPTCSNr5jgHOelItDqas09eYvvzRqHv1
X-Gm-Gg: ASbGncvWoafE/Ie76l3UWY401pVyjeD3MgWQTVtukavmY6FmZawGz2Z/bDpkqENBGIG
	/3x09gEBvIN5exmn2oV6f4PcyrlM9IvLkZ1mQGwpMRuSp/OFdNthzsdHOUW6Ik/cizH51XC9ANa
	UWxfCLS429HrifYo4PcwQFMsjmZNgfwU5xhWn8QkiuRXnDc2jyUQBZhFBZ7NZ67VAmITkPVRPLI
	N69tSMUQ6FHODfaP4JJZ9CAr5Fvdyfp04MbwL42TLXu1WMrp2gP60JxUUbNeKBi
X-Google-Smtp-Source: AGHT+IG+ollMBmiaOYcyGD4fK0EXbH34IwD2F+IqBBnZbD5S5EK8GUe1Cco16tj20beWZxJ5YP1hQInru/5q0vhDcUY=
X-Received: by 2002:a17:903:228c:b0:243:afef:cd88 with SMTP id
 d9443c01a7336-2486395f193mr4627105ad.11.1756234140425; Tue, 26 Aug 2025
 11:49:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1755096883.git.robin.murphy@arm.com> <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
 <20250826130329.GX4067720@noisy.programming.kicks-ass.net> <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com>
In-Reply-To: <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 26 Aug 2025 11:48:48 -0700
X-Gm-Features: Ac12FXxL0fQGFTk6-3SCJz15Qd8Ums9V_bcQA6gIxaEwQacWk3scYfeQZZ7cYZQ
Message-ID: <CAP-5=fXF2x3hW4Sk+A362T-50cBbw6HVd7KY+QEUjFwT+JL37Q@mail.gmail.com>
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
To: Robin Murphy <robin.murphy@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, will@kernel.org, 
	mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, coresight@lists.linaro.org, 
	iommu@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 26, 2025 at 8:32=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2025-08-26 2:03 pm, Peter Zijlstra wrote:
> > On Wed, Aug 13, 2025 at 06:01:04PM +0100, Robin Murphy wrote:
> >> It may have been different long ago, but today it seems wrong for thes=
e
> >> drivers to skip counting disabled sibling events in group validation,
> >> given that perf_event_enable() could make them schedulable again, and
> >> thus increase the effective size of the group later. Conversely, if a
> >> sibling event is truly dead then it stands to reason that the whole
> >> group is dead, so it's not worth going to any special effort to try to
> >> squeeze in a new event that's never going to run anyway. Thus, we can
> >> simply remove all these checks.
> >
> > So currently you can do sort of a manual event rotation inside an
> > over-sized group and have it work.
> >
> > I'm not sure if anybody actually does this, but its possible.
> >
> > Eg. on a PMU that supports only 4 counters, create a group of 5 and
> > periodically cycle which of the 5 events is off.

I'm not sure this is true, I thought this would fail in the
perf_event_open when adding the 5th event and there being insufficient
counters for the group. Not all PMUs validate a group will fit on the
counters, but I thought at least Intel's core PMU would validate and
not allow this. Fwiw, the metric code is reliant on this behavior as
by default all events are placed into a weak group:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/metricgroup.c?h=3Dperf-tools-next#n631
Weak groups are really just groups that when the perf_event_open fails
retry with the grouping removed. PMUs that don't fail the
perf_event_open are problematic as the reads just report "not counted"
and the metric doesn't work. Sometimes the PMU can't help it due to
errata. There are a bunch of workarounds for those cases carried in
the perf tool, but in general weak groups working is relied upon:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/pmu-events/pmu-events.h?h=3Dperf-tools-next#n16

Thanks,
Ian

> > So I'm not against changing this, but changing stuff like this always
> > makes me a little fearful -- it wouldn't be the first time that when it
> > finally trickles down to some 'enterprise' user in 5 years someone come=
s
> > and finally says, oh hey, you broke my shit :-(
>
> Eww, I see what you mean... and I guess that's probably lower-overhead
> than actually deleting and recreating the sibling event(s) each time,
> and potentially less bother then wrangling multiple groups for different
> combinations of subsets when one simply must still approximate a complex
> metric that requires more counters than the hardware offers.
>
> I'm also not keen to break anything that wasn't already somewhat broken,
> especially since this patch is only intended as cleanup, so either we
> could just drop it altogether, or perhaps I can wrap the existing
> behaviour in a helper that can at least document this assumption and
> discourage new drivers from copying it. Am I right that only
> PERF_EVENT_STATE_{OFF,ERROR} would matter for this, though, and my
> reasoning for state <=3D PERF_EVENT_STATE_EXIT should still stand? As for
> the fiddly discrepancy with enable_on_exec between arm_pmu and others
> I'm not really sure what to think...
>
> Thanks,
> Robin.
