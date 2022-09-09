Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3194765A
	for <loongarch@lists.linux.dev>; Fri,  9 Sep 2022 08:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75658C433D6;
	Fri,  9 Sep 2022 08:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662710691;
	bh=a1cYy5MrT3rsObddkZ5SvOhpaU4KtFmno4KfYtVj8Xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=am4NbRnsoHr+0A8vcwv0XHWU0b+BxgCE2O20ksCk5uDUOlVL/OaPRJvnrdYTE7l+v
	 lyMmCTIKkCdVwi5IMVXB/+Nac32pqEXrkINMqz88oAk/07686msx+m9hBpumRxASwz
	 sAaOOTatfSCjwPEqrx9z6E8FyPGS7itc6BEvT69gm9CgEyKV1lOa5iZH0SVjhAGxBR
	 QT+AGYi0uUpyOZkYNukudD6SYAWU2OUzTSwUZ87FL8yzgEciRVrzNHBPzcTSReYg+W
	 wIX2NVCa/RBmMAcQbvPZkZO4WNIOGqHAJ6k5fmHWyynPL95y8LJZK77LxkhBk8y26p
	 sOWd+CLheXNtw==
Date: Fri, 9 Sep 2022 10:04:44 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jianmin Lv <lvjianmin@loongson.cn>
Cc: Robin Murphy <robin.murphy@arm.com>, chenhuacai@loongson.cn,
	guohanjun@huawei.com, sudeep.holla@arm.com, rafael@kernel.org,
	lenb@kernel.org, robert.moore@intel.com,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH V3 1/2] ACPI / scan: Support multiple dma windows with
 different offsets
Message-ID: <YxrznBoBQycR8xCA@lpieralisi>
References: <20220830030139.29899-1-lvjianmin@loongson.cn>
 <20220830030139.29899-2-lvjianmin@loongson.cn>
 <435e1283-9ff6-f089-6436-3c31a178fd60@arm.com>
 <66baf6f8-0f18-e0a6-4ed4-e2f783497d2d@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66baf6f8-0f18-e0a6-4ed4-e2f783497d2d@loongson.cn>

On Tue, Sep 06, 2022 at 08:40:48PM +0800, Jianmin Lv wrote:
> 
> 
> On 2022/9/5 下午8:20, Robin Murphy wrote:
> > On 2022-08-30 04:01, Jianmin Lv wrote:
> > > For DT, of_dma_get_range returns bus_dma_region typed dma regions,
> > > which makes multiple dma windows with different offset available
> > > for translation between dma address and cpu address.
> > > 
> > > But for ACPI, acpi_dma_get_range doesn't return similar dma regions,
> > > causing no path for setting dev->dma_range_map conveniently. So the
> > > patch changes acpi_dma_get_range and returns bus_dma_region typed
> > > dma regions according to of_dma_get_range.
> > > 
> > > After changing acpi_dma_get_range, acpi_arch_dma_setup is changed for
> > > ARM64, where original dma_addr and size are removed as these
> > > arguments are now redundant, and pass 0 and U64_MAX for dma_base
> > > and size of arch_setup_dma_ops, so this is a simplification consistent
> > > with what other ACPI architectures also pass to iommu_setup_dma_ops().
> > 
> > Other than a micro-nit that acpi_dma_get_range() could probably use
> > resource_size(),
> > 
> 
> Ok, thanks, I'll use resource_size() in acpi_dma_get_range().

Are you reposting this shortly ? We are almost at -rc5, it would
be good if we can proceed promptly.

Thanks,
Lorenzo

> > Reviewed-by: Robin Murphy <robin.murphy@arm.com>
> > 
> > It took me longer than I care to admit to figure out where the implicit
> > declaration of struct bus_dma_region in the scope of acpi.h and
> > acpi_bus.h comes from, but in the end I guess it's sufficiently
> > well-defined by the C spec to be reliable.
> > 
> > Thanks for getting this done!
> > 
> 
> It's a pleasure!
> 
> 
> > Robin.
> > 
> 
> [...]
> 
> 
